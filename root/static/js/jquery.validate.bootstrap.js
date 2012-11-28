/**
 * Adapt validator plugin to work with twitter bootstrap
 */
$.extend($.validator.prototype, {
    showLabel: function (element, message) {
        var label = this.errorsFor(element);

        if (label.length == 0) {
            var railsGenerated = $(element).next('span.help-inline');
            if (railsGenerated.length) {
                railsGenerated.attr('for', this.idOrName(element))
                railsGenerated.attr('generated', 'true');
                label = railsGenerated;
            }
        }

        if (label.length) {
            // refresh error/success class
            label.removeClass(this.settings.validClass).addClass(this.settings.errorClass);
            // check if we have a generated label, replace the message then
            label.attr('generated') && label.html(message);
        } else {
            // create label
            label = $('<' + this.settings.errorElement + '/>').attr({
                'for': this.idOrName(element),
                generated: true
            }).addClass(this.settings.errorClass).addClass('help-inline').html(message || '');
            if (this.settings.wrapper) {
                // make sure the element is visible, even in IE
                // actually showing the wrapped element is handled elsewhere
                label = label.hide().show().wrap('<' + this.settings.wrapper + '/>').parent();
            }
            if (!this.labelContainer.append(label).length) this.settings.errorPlacement ? this.settings.errorPlacement(label, $(element)) : label.insertAfter(element);
        }
        if (!message && this.settings.success) {
            label.text('');
            typeof this.settings.success == 'string' ? label.addClass(this.settings.success) : this.settings.success(label);
        }
        this.toShow = this.toShow.add(label);
    }
});

/**
 * Setting custom validator defaults to work with twitter bootstrap
 */
$.extend($.validator.defaults, {
    errorClass: 'error',
    validClass: 'success',
    errorElement: 'span',
    highlight: function (element, errorClass, validClass) {
        if (element.type === 'radio') {
            this.findByName(element.name).parent('div').parent('div').removeClass(validClass).addClass(errorClass);
        } else if ($(element).parent('div.control-group').length > 0) {
            $(element).parent('div').removeClass(validClass).addClass(errorClass);
        } else if ($(element).parent('div.input-prepend, div.input-append').length > 0) {
            $(element).parent('div').parent('div').parent('div').removeClass(validClass).addClass(errorClass);
        } else {
            $(element).parent('div').parent('div').removeClass(validClass).addClass(errorClass);
        }
    },
    unhighlight: function (element, errorClass, validClass) {
        if (element.type === 'radio') {
            this.findByName(element.name).parent('div').parent('div').removeClass(errorClass);
        } else if ($(element).parent('div.control-group').length > 0) {
            $(element).parent('div').removeClass(errorClass);
            $(element).next('span.help-inline').text('');
        } else if ($(element).parent('div.input-prepend, div.input-append').length > 0) {
            $(element).parent('div').parent('div').parent('div').removeClass(errorClass);
            $(element).next('span.help-inline').text('');
        } else {
            $(element).parent('div').parent('div').removeClass(errorClass);
            $(element).next('span.help-inline').text('');
        }
    }
});
