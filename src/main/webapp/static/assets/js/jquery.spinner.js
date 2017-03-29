(function ($) {
	var Spinner = function (ele, opts) {
		this.$element = $(ele);
		this.options = $.extend({}, $.fn.spinner.settings, opts);
		this.$input = this.$element.find(".spinner-input");
		this.$element.on("keyup", this.$input, $.proxy(this.change, this));

		if (this.options.hold) {
			// 模拟鼠标点击，按住不放也可以
			this.$element.on("mousedown", ".spinner-up", $.proxy(function () {this.startSpin(true)}, this));
			this.$element.on("mousedown", ".spinner-down", $.proxy(function () {this.startSpin(false)}, this));
			this.$element.on("mouseup", ".spinner-up, .spinner-down", $.proxy(this.stopSpin, this));
			this.$element.on("mouseout", ".spinner-up, .spinner-down", $.proxy(this.stopSpin, this));
		} else {
			this.$element.on("click", ".spinner-up", $.proxy(function () {
				this.step(true);
			}, this));

			this.$element.on("click", ".spinner-down", $.proxy(function () {
				this.step(false);
			}, this));
		}

		this._switches = {count: 1, speed: 300, timeout: 0};

		if (this.options.speed === "medium") {
			this._switches.speed = 300;
		} else {
			if (this.options.speed === "fast") {
				this._switches.speed = 100;
			} else {
				this._switches.speed = 500;
			}
		}

		this._lastValue = null;

		this.render();

		if (this.options.disabled) {
			this.disable();
		}

	};
	Spinner.prototype = {
		constructor        : Spinner,
		render             : function () {
			this.$input.val(this.options.value);
			this.$input.attr("maxlength", (this.options.max + "").length);
		},
		change             : function () {
			var val = this.$input.val();
			// 过滤除数字以外的字符
			if (!( val / 1 )) {
				val = val.replace(/[^0-9]/g, "");
				this.$input.val(val);
			}
			this.options.value = val;
			this.triggerChangedEvent();
		},
		stopSpin           : function () {
			clearTimeout(this._switches.timeout);
			this._switches.count = 1;
			this.triggerChangedEvent();
		},
		triggerChangedEvent: function () {
			var val = this.value();
			if (val === this._lastValue) {
				return;
			}
			this._lastValue = val;
			this.$element.trigger("change");
		},
		startSpin          : function (isUpDown) {
			if (!this.options.disabled) {
				var count = this._switches.count;
				if (count === 1) {
					this.step(isUpDown);
					count = 1;
				} else {
					if (count < 3) {
						count = 1.5;
					} else {
						if (count < 8) {
							count = 2.5;
						} else {
							count = 4;
						}
					}
				}

				this._switches.timeout = setTimeout($.proxy(function () {
					this.iterator(isUpDown);
				}, this), this._switches.speed / count);

				this._switches.count++;
			}
		},
		iterator           : function (isUpDown) {  // 迭代器
			this.step(isUpDown);
			this.startSpin(isUpDown);
		},
		step               : function (isUpDown) {
			var val           = parseFloat(this.options.value),
			    boundaryValue = isUpDown ? this.options.max : this.options.min, // 边值
			    isOutBoundary = isUpDown ? val < boundaryValue : val > boundaryValue;  // 判断是否越界

			if (isOutBoundary) {
				var curVal = val + (isUpDown ? 1 : -1) * this.options.step;
				if (isUpDown ? curVal > boundaryValue : curVal < boundaryValue) {
					this.value(boundaryValue);
				} else {
					this.value(curVal);
				}
			}
		},
		value              : function (val) {
			if (!isNaN(parseFloat(val)) && isFinite(val)) {
				val = parseFloat(val);
				this.options.value = val;
				this.$input.val(val);
				return this;
			} else {
				return this.options.value;
			}
		},
		disable            : function () {
			this.options.disabled = true;
			this.$input.attr("disabled", "");
			this.$element.find("button").addClass("disabled");
		},
		enable             : function () {
			this.options.disabled = false;
			this.$input.removeAttr("disabled");
			this.$element.find("button").removeClass("disabled");
		}
	};

	$.fn.spinner = function (obj) {
		var $this = this;
		return $this.each(function () {
			var _this = $(this), _spinner = _this.data("spinner");
			if (!_spinner) {
				_this.data("spinner", (_spinner = new Spinner(this, obj)));
			}
		});
	};

	$.fn.spinner.settings = {
		value   : 1,
		min     : 1,
		max     : 999,
		step    : 1,
		hold    : true,
		speed   : "medium",
		disabled: false
	};

	$.fn.spinner.Constructor = Spinner;
	
})(jQuery);