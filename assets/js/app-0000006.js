var tinySetup = {
    selector: '.wysiwyg',
    height: 200,
    theme: 'modern',
    plugins: [
        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
        'searchreplace wordcount visualblocks visualchars code fullscreen',
        'insertdatetime media nonbreaking save table contextmenu directionality',
        'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc'
    ],
    toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
    toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
    image_advtab: true,
    templates: [
        { title: 'Test template 1', content: 'Test 1' },
        { title: 'Test template 2', content: 'Test 2' }
    ],
    content_css: [
        '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    ]
};
$(document).ready(function () {

    // manage close action on modal
    $("#ajaxModal").on('hide.bs.modal', function (e) {
        if (localStorage.getItem('isPopup') == 'true' && e.namespace == "bs.modal") {
            localStorage.setItem('isPopup', 'false');
            postTask.updateListeners({});
        }
    });

    window.postTask = {
        updateListeners: function (newData) {
            $('.modal-dialog').not('.main-modal').remove();
            localStorage.setItem('isPopup', 'false');
            var timeOut = typeof newData.title == 'undefined' ? 100 : 1200;

            setTimeout(function () {
                $('#previousAjaxModal')
                    .find(".modal-body")
                    .mCustomScrollbar("destroy").removeClass('mCS_destroyed')
                    .find(".select2, .tagged")
                    .select2('destroy');
                $('#previousAjaxModal').find('.select2-container').remove();
                $('#previousAjaxModal').find('.tagged').removeAttr('style');

                var modal = $("#ajaxModal");
                modal.find('.modal-dialog').remove();
                modal.append($("#previousAjaxModal").find('.modal-dialog').clone());
                $("#previousAjaxModal").find('.modal-dialog').html('');

                var updateId = localStorage.getItem('populates');
                var updateField = modal.find('#' + updateId);
                var $scroll = modal.find(".modal-body"),
                    height = $scroll.height(),
                    maxHeight = $(window).height() - 200;

                modal.find('.select2').select2();

                $("#project_labels").select2('destroy').select2({
                    tags: JSON.parse(localStorage.getItem('projectLabels'))
                });

                $("#collaborators").select2('destroy').select2({
                    tags: JSON.parse(localStorage.getItem('collaborators'))
                });

                $("#title").focus();
                setDatePicker("#start_date, #end_date, #deadline");
                $('[data-toggle="tooltip"]').tooltip();
                if (typeof newData.title != 'undefined') {
                    updateField.append($('<option value="' + newData.id + '" selected>' + newData.title + '</option>'));
                    updateField.select2('data', {id: newData.id, text: newData.title});
                }

                $("#task-form").appForm({
                    onSuccess: function (result) {
                        $("#task-table").appTable({newData: result.data, dataId: result.id});
                    }
                });

                $("#project-form").appForm({
                    onSuccess: function (result) {
                        $("#project-table").appTable({newData: result.data, dataId: result.id});
                        setTimeout(function () {
                            location.reload();
                        }, 100);
                    }
                });

                $('.modal-dialog').not('.main-modal').remove();

                modal.modal('show');

                if (height > maxHeight) {
                    height = maxHeight;
                }
                $scroll.mCustomScrollbar({setHeight: height, theme: "minimal-dark", autoExpandScrollbar: true});

            }, timeOut);

        }
    };

    $.ajaxSetup({cache: false});

    //set locale of moment js
    moment.locale(AppLanugage.locale);

    //set locale for datepicker

    (function ($) {
        $.fn.datepicker.dates['custom'] = {
            days: AppLanugage.days,
            daysShort: AppLanugage.daysShort,
            daysMin: AppLanugage.daysMin,
            months: AppLanugage.months,
            monthsShort: AppLanugage.monthsShort,
            today: AppLanugage.today
        };
    }(jQuery));

    //set datepicker language

    $('body').on('click', '[data-act=ajax-modal]', function () {
        // backup current modal
        $('textarea').summernote('destroy');
        $('.modal-dialog').not('.main-modal').remove();
        $('.note-editor').remove();

        $('#previousAjaxModal').find('.modal-dialog').remove();
        $("#ajaxModalContent").find(".modal-body").mCustomScrollbar("destroy").removeClass('mCS_destroyed');
        $("#ajaxModalContent").find(".select2").select2('destroy');
        $('#previousAjaxModal').append($("#ajaxModal .modal-dialog").clone());
        localStorage.setItem('isPopup', $(this).attr('data-is-popup') == 1);
        localStorage.setItem('populates', $(this).attr('data-populate'));

        var data = {ajaxModal: 1},
        url = $(this).attr('data-action-url'),
                isLargeModal = $(this).attr('data-modal-lg'),
                title = $(this).attr('data-title');
        if (!url) {
            console.log('Ajax Modal: Set data-action-url!');
            return false;
        }
        if (title) {
            $("#ajaxModalTitle").html(title);
        } else {
            $("#ajaxModalTitle").html($("#ajaxModalTitle").attr('data-title'));
        }

        $("#ajaxModalContent").html($("#ajaxModalOriginalContent").html());
        $("#ajaxModalContent").find(".original-modal-body").removeClass("original-modal-body").addClass("modal-body");
        $("#ajaxModal").modal('show');

        $(this).each(function () {
            $.each(this.attributes, function () {
                if (this.specified && this.name.match("^data-post-")) {
                    var dataName = this.name.replace("data-post-", "");
                    data[dataName] = this.value;
                }
            });
        });

        ajaxModalXhr = $.ajax({
            url: url,
            data: data,
            cache: false,
            type: 'POST',
            success: function (response) {
                $("#ajaxModal").find(".modal-dialog").removeClass("mini-modal").addClass("modal-lg");

                $("#ajaxModalContent").html(response);

                var $scroll = $("#ajaxModalContent").find(".modal-body"),
                        height = $scroll.height(),
                        maxHeight = $(window).height() - 200;
                if (height > maxHeight) {
                    height = maxHeight;
                    if ($.fn.mCustomScrollbar) {
                        $scroll.mCustomScrollbar({setHeight: height, theme: "minimal-dark", autoExpandScrollbar: true});
                    }
                }

                // tinymce.init(tinySetup);
                //initWYSIWYGEditor('textarea');
            },
            statusCode: {
                404: function () {
                    $("#ajaxModalContent").find('.modal-body').html("");
                    appAlert.error("404: Page not found.", {container: '.modal-body', animate: false});
                }
            },
            error: function () {
                $("#ajaxModalContent").find('.modal-body').html("");
                appAlert.error("500: Internal Server Error.", {container: '.modal-body', animate: false});
            }
        });

        $('.modal-dialog').not('.main-modal').remove();
        return false;
    });

    //abort ajax request on modal close.
    $('#ajaxModal').on('hidden.bs.modal', function (e) {
        ajaxModalXhr.abort();
        $("#ajaxModal").find(".modal-dialog").removeClass("modal-lg");
        $("#ajaxModal").find(".modal-dialog").addClass("mini-modal");

        $("#ajaxModalContent").html("");
    });

    //common ajax request
    $('body').on('click', '[data-act=ajax-request]', function () {
        var data = {},
                $selector = $(this),
                url = $selector.attr('data-action-url'),
                removeOnSuccess = $selector.attr('data-remove-on-success'),
                removeOnClick = $selector.attr('data-remove-on-click'),
                fadeOutOnSuccess = $selector.attr('data-fade-out-on-success'),
                fadeOutOnClick = $selector.attr('data-fade-out-on-click'),
                inlineLoader = $selector.attr('data-inline-loader'),
                reloadOnSuccess = $selector.attr('data-reload-on-success');

        var $target = "";
        if ($selector.attr('data-real-target')) {
            $target = $($selector.attr('data-real-target'));
        } else if ($selector.attr('data-closest-target')) {
            $target = $selector.closest($selector.attr('data-closest-target'));
        }

        if (!url) {
            console.log('Ajax Request: Set data-action-url!');
            return false;
        }

        //remove the target element
        if (removeOnClick && $(removeOnClick).length) {
            $(removeOnClick).remove();
        }

        //remove the target element with fade out effect
        if (fadeOutOnClick && $(fadeOutOnClick).length) {
            $(fadeOutOnClick).fadeOut(function () {
                $(this).remove();
            });
        }

        $selector.each(function () {
            $.each(this.attributes, function () {
                if (this.specified && this.name.match("^data-post-")) {
                    var dataName = this.name.replace("data-post-", "");
                    data[dataName] = this.value;
                }
            });
        });
        if (inlineLoader === "1") {
            $selector.addClass("inline-loader");
        } else {
            appLoader.show();
        }

        ajaxRequestXhr = $.ajax({
            url: url,
            data: data,
            cache: false,
            type: 'POST',
            success: function (response) {
                if (reloadOnSuccess) {
                    location.reload();
                }

                //remove the target element
                if (removeOnSuccess && $(removeOnSuccess).length) {
                    $(removeOnSuccess).remove();
                }

                //remove the target element with fade out effect
                if (fadeOutOnSuccess && $(fadeOutOnSuccess).length) {
                    $(fadeOutOnSuccess).fadeOut(function () {
                        $(this).remove();
                    });
                }

                appLoader.hide();
                if ($target.length) {
                    $target.html(response);
                }
            },
            statusCode: {
                404: function () {
                    appLoader.hide();
                    appAlert.error("404: Page not found.");
                }
            },
            error: function () {
                appLoader.hide();
                appAlert.error("500: Internal Server Error.");
            }
        });

    });

    //bind ajax tab
    $('body').on('click', '[data-toggle="ajax-tab"] a', function () {
        var $this = $(this),
                loadurl = $this.attr('href'),
                target = $this.attr('data-target');
        if ($(target).html() === "") {
            appLoader.show({container: target, css: "right:50%; bottom:auto;"});
            $.get(loadurl, function (data) {
                $(target).html(data);
            });
        }
        $this.tab('show');
        return false;
    });
    //auto load first tab
    $('[data-toggle="ajax-tab"] a').first().trigger("click");

    $('body').on('click', '[data-toggle="app-modal"]', function () {
        var sidebar = true;

        if ($(this).attr("data-sidebar") === "0") {
            sidebar = false;
        }

        appContentModal.init({url: $(this).attr("data-url"), sidebar: sidebar});
        return false;
    });
});


//custom app form controller
(function ($) {
    $.fn.appForm = function (options) {

        var defaults = {
            ajaxSubmit: true,
            isModal: true,
            dataType: "json",
            onModalClose: function () {
            },
            onSuccess: function () {
            },
            onError: function () {
                return true;
            },
            onSubmit: function () {
            },
            onAjaxSuccess: function () {
            },
            beforeAjaxSubmit: function (data, self, options) {
            }
        };
        var settings = $.extend({}, defaults, options);
        this.each(function () {
            if (settings.ajaxSubmit) {
                validateForm($(this), function (form) {
                    settings.onSubmit();
                    if (settings.isModal) {
                        maskModal($("#ajaxModalContent").find(".modal-body"));
                    }
                    $(form).ajaxSubmit({
                        dataType: settings.dataType,
                        beforeSubmit: function (data, self, options) {
                            settings.beforeAjaxSubmit(data, self, options);
                        },
                        success: function (result) {
                            settings.onAjaxSuccess(result);

                            if (result.success) {
                                settings.onSuccess(result);
                                if (settings.isModal) {
                                    closeAjaxModal(true);
                                }
                            } else {
                                if (settings.onError(result)) {
                                    if (settings.isModal) {
                                        unmaskModal();
                                        if (result.message) {
                                            appAlert.error(result.message, {container: '.modal-body', animate: false});
                                        }
                                    } else if (result.message) {
                                        appAlert.error(result.message);
                                    }
                                }
                            }
                        }
                    });
                });
            } else {
                validateForm($(this));
            }
        });
        /*
         * @form : the form we want to validate;
         * @customSubmit : execute custom js function insted of form submission. 
         * don't pass the 2nd parameter for regular form submission
         */
        function validateForm(form, customSubmit) {
            //add custom method
            $.validator.addMethod("greaterThanOrEqual",
                    function (value, element, params) {
                        var paramsVal = params;
                        if (params && (params.indexOf("#") === 0 || params.indexOf(".") === 0)) {
                            paramsVal = $(params).val();
                        }
                        if (!/Invalid|NaN/.test(new Date(value))) {
                            return new Date(value) >= new Date(paramsVal);
                        }
                        return isNaN(value) && isNaN(paramsVal)
                                || (Number(value) >= Number(paramsVal));
                    }, 'Must be greater than {0}.');
            $(form).validate({
                submitHandler: function (form) {
                    if (customSubmit) {
                        customSubmit(form);
                    } else {
                        return true;
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                ignore: ":hidden:not(.validate-hidden)",
                errorPlacement: function (error, element) {
                    if (element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
            //handeling the hidden field validation like select2
            $(".validate-hidden").click(function () {
                $(this).closest('.form-group').removeClass('has-error').find(".help-block").hide();
            });
        }

        //show loadig mask on modal before form submission;
        function maskModal($maskTarget) {
            var padding = $maskTarget.height() - 80;
            if (padding > 0) {
                padding = Math.floor(padding / 2);
            }
            $maskTarget.append("<div class='modal-mask'><div class='circle-loader'></div></div>");
            //check scrollbar
            var height = $maskTarget.outerHeight();
            $('.modal-mask').css({"width": $maskTarget.width() + 30 + "px", "height": height + "px", "padding-top": padding + "px"});
            $maskTarget.closest('.modal-dialog').find('[type="submit"]').attr('disabled', 'disabled');
        }

        //remove loadig mask from modal
        function unmaskModal() {
            var $maskTarget = $(".modal-body");
            $maskTarget.closest('.modal-dialog').find('[type="submit"]').removeAttr('disabled');
            $(".modal-mask").remove();
        }

        //colse ajax modal and show success check mark
        function closeAjaxModal(success) {
            if (success) {
                $(".modal-mask").html("<div class='circle-done'><i class='fa fa-check'></i></div>");
                setTimeout(function () {
                    $(".modal-mask").find('.circle-done').addClass('ok');
                }, 30);
            }
            setTimeout(function () {
                $(".modal-mask").remove();
                $("#ajaxModal").modal('toggle');
                settings.onModalClose();
            }, 1000);
        }
    };
})(jQuery);
if (typeof TableTools != 'undefined') {
    TableTools.DEFAULTS.sSwfPath = AppHelper.assetsDirectory + "js/datatable/TableTools/swf/copy_csv_xls_pdf.swf";
}


(function ($) {
    //appTable using datatable
    $.fn.appTable = function (options) {

        //set default display length
        var displayLength = AppHelper.settings.displayLength * 1;

        if (isNaN(displayLength) || !displayLength) {
            displayLength = 10;
        }

        var defaults = {
            source: "", //data url
            xlsColumns: [], // array of excel exportable column numbers
            pdfColumns: [], // array of pdf exportable column numbers
            printColumns: [], // array of printable column numbers
            columns: [], //column title and options
            order: [[0, "asc"]], //default sort value
            hideTools: false, //show/hide tools section
            displayLength: displayLength, //default rows per page
            dateRangeType: "", // type: daily, weekly, monthly, yearly. output params: start_date and end_date
            checkBoxes: [], // [{text: "Caption", name: "status", value: "in_progress", isChecked: true}] 
            radioButtons: [], // [{text: "Caption", name: "status", value: "in_progress", isChecked: true}] 
            filterDropdown: [], // [{id: 10, text:'Caption', isSelected:true}] 
            filterParams: {datatable: true}, //will post this vales on source url
            onDeleteSuccess: function () {
            },
            onUndoSuccess: function () {
            },
            onInitComplete: function () {
            },
            customLanguage: {
                noRecordFoundText: AppLanugage.noRecordFound,
                searchPlaceholder: AppLanugage.search,
                printButtonText: AppLanugage.print,
                excelButtonText: AppLanugage.excel,
                printButtonToolTip: AppLanugage.printButtonTooltip,
                today: AppLanugage.today,
                yesterday: AppLanugage.yesterday,
                tomorrow: AppLanugage.tomorrow
            },
            footerCallback: function (row, data, start, end, display) {
            },
            rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
            },
            summation: "", /* {column: 5, dataType: 'currency'}  dataType:currency, time */
        };

        var $instance = $(this);

        //check if this binding with a table or not
        if (!$instance.is("table")) {
            console.log("Element must have to be a table", this);
            return false;
        }

        var settings = $.extend({}, defaults, options);

        // reload
        if (settings.reload) {
            window._table = table = $(this).dataTable();
            var instanceSettings = window.InstanceCollection[$(this).selector];
            if (!instanceSettings) {
                instanceSettings = settings;
            }
            table.fnReloadAjax(instanceSettings.filterParams);
            return false;
        }

        // add/edit row
        if (settings.newData) {
            window._table = table = $(this).dataTable();
            if (settings.dataId) {
                //check for existing row; if found, delete the row; 

                var $row = $(this).find("[data-post-id='" + settings.dataId + "']");

                if ($row.length) {
                    table.fnDeleteRow($row.closest('tr'));
                } else {
                    var $row2 = $(this).find("[data-index-id='" + settings.dataId + "']");
                    if ($row2.length) {
                        table.fnDeleteRow($row2.closest('tr'));
                    }
                }
            }
            table.fnAddRow(settings.newData);
            return false;
        }

        settings._visible_columns = [];
        $.each(settings.columns, function (index, column) {
            if (column.visible !== false) {
                settings._visible_columns.push(index);
            }
        });

        settings._exportable = settings.xlsColumns.length + settings.pdfColumns.length + settings.printColumns.length;
        settings._firstDayOfWeek = AppHelper.settings.firstDayOfWeek || 0;
        settings._inputDateFormat = "YYYY-MM-DD";

        var getWeekRange = function (date) {
            //set first and last day of week
            if (!date)
                date = moment().format("YYYY-MM-DD");

            var dayOfWeek = moment(date).format("E"),
                    diff = dayOfWeek - AppHelper.settings.firstDayOfWeek,
                    range = {};

            if (diff < 7) {
                range.firstDateOfWeek = moment(date).subtract(diff, 'days').format("YYYY-MM-DD");
            } else {
                range.firstDateOfWeek = moment(date).format("YYYY-MM-DD");
            }

            if (diff < 0) {
                range.firstDateOfWeek = moment(range.firstDateOfWeek).subtract(7, 'days').format("YYYY-MM-DD");
            }

            range.lastDateOfWeek = moment(range.firstDateOfWeek).add(6, 'days').format("YYYY-MM-DD");
            return range;
        };

        var prepareDefaultDateRangeFilterParams = function () {
            if (settings.dateRangeType === "daily") {
                settings.filterParams.start_date = moment().format(settings._inputDateFormat);
                settings.filterParams.end_date = settings.filterParams.start_date;
            } else if (settings.dateRangeType === "monthly") {
                var daysInMonth = moment().daysInMonth(),
                        yearMonth = moment().format("YYYY-MM");
                settings.filterParams.start_date = yearMonth + "-01";
                settings.filterParams.end_date = yearMonth + "-" + daysInMonth;
            } else if (settings.dateRangeType === "yearly") {
                var year = moment().format("YYYY");
                settings.filterParams.start_date = year + "-01-01";
                settings.filterParams.end_date = year + "-12-31";
            } else if (settings.dateRangeType === "weekly") {
                var range = getWeekRange();
                settings.filterParams.start_date = range.firstDateOfWeek;
                settings.filterParams.end_date = range.lastDateOfWeek;
            } else if (settings.dateRangeType === "custom") {
                var range = getWeekRange();
                settings.filterParams.start_date = range.firstDateOfWeek;
                settings.filterParams.end_date = range.lastDateOfWeek;
            }
        };

        var prepareDefaultCheckBoxFilterParams = function () {
            var values = [],
                    name = "";
            $.each(settings.checkBoxes, function (index, option) {
                name = option.name;
                if (option.isChecked) {
                    values.push(option.value);
                }
            });
            settings.filterParams[name] = values;
        };

        var prepareDefaultRadioFilterParams = function () {
            $.each(settings.radioButtons, function (index, option) {
                if (option.isChecked) {
                    settings.filterParams[option.name] = option.value;
                }
            });
        };

        var prepareDefaultDropdownFilterParams = function () {
            $.each(settings.filterDropdown || [], function (index, dropdown) {
                $.each(dropdown.options, function (index, option) {
                    if (option.isSelected) {
                        settings.filterParams[dropdown.name] = option.id;
                    }
                });
            });
        };

        prepareDefaultDateRangeFilterParams();
        prepareDefaultCheckBoxFilterParams();
        prepareDefaultRadioFilterParams();
        prepareDefaultDropdownFilterParams();

        var datatableOptions = {
            // sAjaxSource: settings.source,
            ajax: {
                "url": settings.source,
                "type": "POST",
                "data": settings.filterParams
            },
            sServerMethod: "POST",
            columns: settings.columns,
            bProcessing: true,
            iDisplayLength: settings.displayLength,
            bAutoWidth: false,
            bSortClasses: false,
            order: settings.order,
            fnInitComplete: function () {
                settings.onInitComplete(this);
            },
            language: {
                lengthMenu: "_MENU_",
                zeroRecords: settings.customLanguage.noRecordFoundText,
                info: "_START_-_END_ / _TOTAL_",
                sInfo: "_START_-_END_ / _TOTAL_",
                infoFiltered: "(_MAX_)",
                search: "",
                searchPlaceholder: settings.customLanguage.searchPlaceholder,
                sInfoEmpty: "0-0 / 0",
                sInfoFiltered: "(_MAX_)",
                sInfoPostFix: "",
                sInfoThousands: ",",
                sProcessing: "<div class='table-loader'><span class='loading'></span></div>",
                "oPaginate": {
                    "sPrevious": "<i class='fa fa-angle-double-left'></i>",
                    "sNext": "<i class='fa fa-angle-double-right'></i>"
                }

            },
            sDom: "",
            footerCallback: function (row, data, start, end, display) {
                var instance = this;

                if (settings.summation) {

                    var pageInfo = instance.api().page.info();

                    if (pageInfo.recordsTotal) {
                        $(instance).find("tfoot").show();
                    } else {
                        $(instance).find("tfoot").hide();
                        return false;
                    }

                    $.each(settings.summation, function (index, option) {
                        // total value of current page
                        var pageTotal = calculateDatatableTotal(instance, option.column, function (currentValue) {
                            if (option.dataType === "currency") {
                                return unformatCurrency(currentValue);
                            } else if (option.dataType === "time") {
                                return moment.duration(currentValue).asSeconds();
                            } else if (option.dataType === "float") {
                                return parseFloat(currentValue);
                            } else {
                                return currentValue;
                            }
                        }, true);

                        if (option.dataType === "currency") {
                            pageTotal = toCurrency(pageTotal, option.currencySymbol);
                        } else if (option.dataType === "time") {
                            pageTotal = secondsToTimeFormat(pageTotal);
                        } else if (option.dataType === "float") {
                            pageTotal = pageTotal.toFixed(2);
                        }
                        $(instance).find("[data-current-page=" + option.column + "]").html(pageTotal);

                        // total value of all pages
                        if (pageInfo.pages > 1) {
                            $(instance).find("[data-section='all_pages']").show();
                            var total = calculateDatatableTotal(instance, option.column, function (currentValue) {
                                if (option.dataType === "currency") {
                                    return unformatCurrency(currentValue);
                                } else if (option.dataType === "time") {
                                    return moment.duration(currentValue).asSeconds();
                                } else {
                                    return currentValue;
                                }
                            });

                            if (option.dataType === "currency") {
                                total = toCurrency(total, option.currencySymbol);
                            } else if (option.dataType === "time") {
                                total = secondsToTimeFormat(total);
                            }
                            $(instance).find("[data-all-page=" + option.column + "]").html(total);
                        } else {
                            $(instance).find("[data-section='all_pages']").hide();
                        }
                    });
                }

                settings.footerCallback(row, data, start, end, display, instance);
            },
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                settings.rowCallback(nRow, aData, iDisplayIndex, iDisplayIndexFull);
            },
            "drawCallback": settings.drawCallback
        };

        if (!settings.hideTools) {
            datatableOptions.sDom = "<'datatable-tools'<'col-md-3'l><'col-md-9 custom-toolbar'f>r>t<'datatable-tools clearfix'<'col-md-3'i><'col-md-9'p>>";
        }


        if (settings._exportable) {
            var datatableButtons = [];

            if (settings.xlsColumns.length) {
                //add excel button
                datatableButtons.push({
                    sExtends: "xls",
                    sButtonText: settings.customLanguage.excelButtonText,
                    mColumns: settings.xlsColumns
                });
            }

            if (settings.pdfColumns.length) {
                //add pdf button
                datatableButtons.push({
                    sExtends: "pdf",
                    mColumns: settings.pdfColumns
                });
            }

            if (settings.printColumns.length) {
                //prepear print preview
                var arrayDiff = function (array1, array2) {
                    return array1.filter(function (i) {
                        return array2.indexOf(i) < 0;
                    });
                };
                settings._hiddenColumns = (arrayDiff(settings._visible_columns, settings.printColumns));
                datatableButtons.push({
                    sExtends: "print",
                    sButtonText: settings.customLanguage.printButtonText,
                    sToolTip: settings.customLanguage.printButtonToolTip,
                    sInfo: "",
                    fnClick: function (nButton, oConfig) {
                        //hide columns
                        for (var key in settings._hiddenColumns) {
                            oTable.fnSetColumnVis(settings._hiddenColumns[key], false);
                        }

                        $("html").addClass('print-peview');

                        $(".scrollable-page").addClass("print-peview");
                        this.fnPrint(true, oConfig);
                        //window.print();
                        $(window).keydown(function (e) {
                            //exit print preview;
                            if (e.which === 27) {
                                //show columns which has hidden during print preview
                                for (var key in settings._hiddenColumns) {
                                    oTable.fnSetColumnVis(settings._hiddenColumns[key], true);
                                }
                                $(".print-peview").removeClass("print-peview");
                                setPageScrollable();
                                $(".dataTables_processing").hide();
                            }
                        });
                    }
                });
            }
            if (!settings.hideTools) {
                datatableOptions.sDom = "<'datatable-tools'<'col-md-3'l><'col-md-9 custom-toolbar'f<'datatable-export'T>>r>t<'datatable-tools clearfix'<'col-md-3'i><'col-md-9'p>>";
            }

            datatableOptions.oTableTools = {
                aButtons: datatableButtons
            };
        }
        var oTable = $instance.dataTable(datatableOptions),
                $instanceWrapper = $instance.closest(".dataTables_wrapper");

        $instanceWrapper.find('.DTTT_button_print').tooltip({
            placement: 'bottom',
            container: 'body'
        });
        $instanceWrapper.find("select").select2({
            minimumResultsForSearch: -1
        });


        //build date wise filter selectors
        if (settings.dateRangeType) {
            var dateRangeFilterDom = '<div class="mr15 DTTT_container">'
                    + '<button data-act="prev" class="btn btn-default date-range-selector"><i class="fa fa-chevron-left"></i></button>'
                    + '<button data-act="datepicker" class="btn btn-default" style="margin: -1px"></button>'
                    + '<button data-act="next"  class="btn btn-default date-range-selector"><i class="fa fa-chevron-right"></i></button>'
                    + '</div>';
            if (settings.dateRangeType === "custom") {
                dateRangeFilterDom = '<div class="mr15 DTTT_container">'
                    + '<div class="input-group input-daterange">'
                    + '<input type="text" class="form-control" id="from_date"><div class="input-group-addon">to</div>'
                    + '<input type="text" class="form-control" id="to_date">'
                    + '</div>'
                    + '</div>';
            }

            $instanceWrapper.find(".custom-toolbar").append(dateRangeFilterDom);

            var $datepicker = $instanceWrapper.find("[data-act='datepicker']"),
                    $dateRangeSelector = $instanceWrapper.find(".date-range-selector");

            //init custom selector
            if (settings.dateRangeType === "custom") {
                var initCustomSelectorText = function () {
                    var from = moment(settings.filterParams.start_date).format("DD MMMM YYYY");

                    $instanceWrapper.find("#from_date").val(from).datepicker({
                        format: "dd MM yyyy",
                        autoclose: true,
                        weekStart: AppHelper.settings.firstDayOfWeek
                    });

                    $instanceWrapper.find("#to_date").val(from).datepicker({
                        format: "dd MM yyyy",
                        autoclose: true,
                        weekStart: AppHelper.settings.firstDayOfWeek,
                        startDate: from
                    });
                };

                prepareDefaultDateRangeFilterParams();
                initCustomSelectorText();

                $instanceWrapper.find("#from_date").datepicker({
                    format: settings._inputDateFormat,
                    autoclose: true,
                    calendarWeeks: true,
                    language: "custom",
                    weekStart: AppHelper.settings.firstDayOfWeek
                }).on('changeDate', function (e) {
                    settings.filterParams.start_date = moment(e.date).format(settings._inputDateFormat);
                    initCustomSelectorText();
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                    $instanceWrapper.find("#to_date").datepicker('setStartDate', e.date);
                });

                $instanceWrapper.find("#to_date").datepicker({
                    format: settings._inputDateFormat,
                    autoclose: true,
                    calendarWeeks: true,
                    language: "custom",
                    weekStart: AppHelper.settings.firstDayOfWeek
                }).on('changeDate', function (e) {
                    settings.filterParams.end_date = moment(e.date).format(settings._inputDateFormat);
                    initCustomSelectorText();
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            }

            //init single day selector
            if (settings.dateRangeType === "daily") {
                var initSingleDaySelectorText = function ($elector) {
                    if (settings.filterParams.start_date === moment().format(settings._inputDateFormat)) {
                        $elector.html(settings.customLanguage.today);
                    } else if (settings.filterParams.start_date === moment().subtract(1, 'days').format(settings._inputDateFormat)) {
                        $elector.html(settings.customLanguage.yesterday);
                    } else if (settings.filterParams.start_date === moment().add(1, 'days').format(settings._inputDateFormat)) {
                        $elector.html(settings.customLanguage.tomorrow);
                    } else {
                        $elector.html(moment(settings.filterParams.start_date).format("Do, MMMM YYYY"));
                    }
                };
                prepareDefaultDateRangeFilterParams();
                initSingleDaySelectorText($datepicker);

                //bind the click events
                $datepicker.datepicker({
                    format: settings._inputDateFormat,
                    autoclose: true,
                    todayHighlight: true,
                    language: "custom",
                }).on('changeDate', function (e) {
                    var date = moment(e.date).format(settings._inputDateFormat);

                    settings.filterParams.start_date = date;
                    settings.filterParams.end_date = date;
                    initSingleDaySelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });

                $dateRangeSelector.click(function () {
                    var type = $(this).attr("data-act"), date = "";
                    if (type === "next") {
                        date = moment(settings.filterParams.start_date).add(1, 'days').format(settings._inputDateFormat);
                    } else if (type === "prev") {
                        date = moment(settings.filterParams.start_date).subtract(1, 'days').format(settings._inputDateFormat)
                    }
                    settings.filterParams.start_date = date;
                    settings.filterParams.end_date = date;
                    initSingleDaySelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            }

            //init month selector
            if (settings.dateRangeType === "monthly") {
                var initMonthSelectorText = function ($elector) {
                    $elector.html(moment(settings.filterParams.start_date).format("MMMM YYYY"));
                };

                prepareDefaultDateRangeFilterParams();
                initMonthSelectorText($datepicker);

                //bind the click events
                $datepicker.datepicker({
                    format: "YYYY-MM",
                    viewMode: "months",
                    minViewMode: "months",
                    autoclose: true,
                    language: "custom",
                }).on('changeDate', function (e) {
                    var date = moment(e.date).format(settings._inputDateFormat);
                    var daysInMonth = moment(date).daysInMonth(),
                            yearMonth = moment(date).format("YYYY-MM");
                    settings.filterParams.start_date = yearMonth + "-01";
                    settings.filterParams.end_date = yearMonth + "-" + daysInMonth;
                    initMonthSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });

                $dateRangeSelector.click(function () {
                    var type = $(this).attr("data-act"),
                            startDate = moment(settings.filterParams.start_date),
                            endDate = moment(settings.filterParams.end_date);
                    if (type === "next") {
                        startDate = startDate.add(1, 'months').format(settings._inputDateFormat);
                        endDate = endDate.add(1, 'months').format(settings._inputDateFormat);
                    } else if (type === "prev") {
                        startDate = startDate.subtract(1, 'months').format(settings._inputDateFormat);
                        endDate = endDate.subtract(1, 'months').format(settings._inputDateFormat);
                    }
                    settings.filterParams.start_date = startDate;
                    settings.filterParams.end_date = endDate;
                    initMonthSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            }

            //init year selector
            if (settings.dateRangeType === "yearly") {
                var inityearSelectorText = function ($elector) {
                    $elector.html(moment(settings.filterParams.start_date).format("YYYY"));
                };
                prepareDefaultDateRangeFilterParams();
                inityearSelectorText($datepicker);

                //bind the click events
                $datepicker.datepicker({
                    format: "YYYY-MM",
                    viewMode: "years",
                    minViewMode: "years",
                    autoclose: true,
                    language: "custom",
                }).on('changeDate', function (e) {
                    var date = moment(e.date).format(settings._inputDateFormat),
                            year = moment(date).format("YYYY");
                    settings.filterParams.start_date = year + "-01-01";
                    settings.filterParams.end_date = year + "-12-31";
                    inityearSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });

                $dateRangeSelector.click(function () {
                    var type = $(this).attr("data-act"),
                            startDate = moment(settings.filterParams.start_date),
                            endDate = moment(settings.filterParams.end_date);
                    if (type === "next") {
                        startDate = startDate.add(1, 'years').format(settings._inputDateFormat);
                        endDate = endDate.add(1, 'years').format(settings._inputDateFormat);
                    } else if (type === "prev") {
                        startDate = startDate.subtract(1, 'years').format(settings._inputDateFormat);
                        endDate = endDate.subtract(1, 'years').format(settings._inputDateFormat);
                    }
                    settings.filterParams.start_date = startDate;
                    settings.filterParams.end_date = endDate;
                    inityearSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            }

            //init week selector
            if (settings.dateRangeType === "weekly") {
                var initWeekSelectorText = function ($elector) {
                    var from = moment(settings.filterParams.start_date).format("Do MMM"),
                            to = moment(settings.filterParams.end_date).format("Do MMM, YYYY");
                    $datepicker.datepicker({
                        format: "YYYY-MM-DD",
                        autoclose: true,
                        calendarWeeks: true,
                        language: "custom",
                        weekStart: AppHelper.settings.firstDayOfWeek
                    });
                    $elector.html(from + " - " + to);
                };

                prepareDefaultDateRangeFilterParams();
                initWeekSelectorText($datepicker);

                //bind the click events
                $dateRangeSelector.click(function () {
                    var type = $(this).attr("data-act"),
                            startDate = moment(settings.filterParams.start_date),
                            endDate = moment(settings.filterParams.end_date);
                    if (type === "next") {
                        startDate = startDate.add(7, 'days').format(settings._inputDateFormat);
                        endDate = endDate.add(7, 'days').format(settings._inputDateFormat);
                    } else if (type === "prev") {
                        startDate = startDate.subtract(7, 'days').format(settings._inputDateFormat);
                        endDate = endDate.subtract(7, 'days').format(settings._inputDateFormat);
                    }
                    settings.filterParams.start_date = startDate;
                    settings.filterParams.end_date = endDate;
                    initWeekSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });

                $datepicker.datepicker({
                    format: settings._inputDateFormat,
                    autoclose: true,
                    calendarWeeks: true,
                    language: "custom",
                    weekStart: AppHelper.settings.firstDayOfWeek
                }).on("show", function () {
                    $(".datepicker").addClass("week-view");
                    $(".datepicker-days").find(".active").siblings(".day").addClass("active");
                }).on('changeDate', function (e) {
                    var range = getWeekRange(e.date);
                    settings.filterParams.start_date = range.firstDateOfWeek;
                    settings.filterParams.end_date = range.lastDateOfWeek;
                    initWeekSelectorText($datepicker);
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            }
        }

        //build checkbox filter
        if (typeof settings.checkBoxes[0] !== 'undefined') {
            var checkboxes = "", values = [], name = "";
            $.each(settings.checkBoxes, function (index, option) {
                var checked = "", active = "";
                name = option.name;
                if (option.isChecked) {
                    checked = " checked";
                    active = " active";
                    values.push(option.value);
                }
                checkboxes += '<label class="btn btn-default ' + active + '">';
                checkboxes += '<input type="checkbox" name="' + option.name + '" value="' + option.value + '" autocomplete="off" ' + checked + '>' + option.text;
                checkboxes += '</label>';
            });
            settings.filterParams[name] = values;
            var checkboxDom = '<div class="mr15 DTTT_container">'
                    + '<div class="btn-group filter" data-act="checkbox" data-toggle="buttons">'
                    + checkboxes
                    + '</div>'
                    + '</div>';
            $instanceWrapper.find(".custom-toolbar").append(checkboxDom);

            var $checkbox = $instanceWrapper.find("[data-act='checkbox']");
            $checkbox.click(function () {
                var $selector = $(this);
                setTimeout(function () {
                    var values = [],
                            name = "";
                    $selector.parent().find("input:checkbox").each(function () {
                        name = $(this).attr("name");
                        if ($(this).is(":checked")) {
                            values.push($(this).val());
                        }
                    });
                    settings.filterParams[name] = values;
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            });
        }


        //build radio button filter
        if (typeof settings.radioButtons[0] !== 'undefined') {
            var radiobuttons = "";
            $.each(settings.radioButtons, function (index, option) {
                var checked = "", active = "";
                if (option.isChecked) {
                    checked = " checked";
                    active = " active";
                    settings.filterParams[option.name] = option.value;
                }
                radiobuttons += '<label class="btn btn-default ' + active + '">';
                radiobuttons += '<input type="radio" name="' + option.name + '" value="' + option.value + '" autocomplete="off" ' + checked + '>' + option.text;
                radiobuttons += '</label>';
            });
            var radioDom = '<div class="mr15 DTTT_container">'
                    + '<div class="btn-group filter" data-act="radio" data-toggle="buttons">'
                    + radiobuttons
                    + '</div>'
                    + '</div>';
            $instanceWrapper.find(".custom-toolbar").append(radioDom);

            var $radioButtons = $instanceWrapper.find("[data-act='radio']");
            $radioButtons.click(function () {
                var $selector = $(this);
                setTimeout(function () {
                    $selector.parent().find("input:radio").each(function () {
                        if ($(this).is(":checked")) {
                            settings.filterParams[$(this).attr("name")] = $(this).val();
                        }
                    });
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            });
        }


        //build dropdown filter
        if (typeof settings.filterDropdown[0] !== 'undefined') {
            var radiobuttons = "";
            $.each(settings.filterDropdown, function (index, dropdown) {
                var optons = "", selectedValue = "";

                $.each(dropdown.options, function (index, option) {
                    var isSelected = "";
                    if (option.isSelected) {
                        isSelected = "selected";
                        selectedValue = option.id;
                    }
                    optons += '<option ' + isSelected + ' value="' + option.id + '">' + option.text + '</option>';
                });

                if (dropdown.name) {
                    settings.filterParams[dropdown.name] = selectedValue;
                }

                var selectDom = '<div class="mr15 DTTT_container">'
                        + '<select class="' + dropdown.class + '" name="' + dropdown.name + '">'
                        + optons
                        + '</select>'
                        + '</div>';
                $instanceWrapper.find(".custom-toolbar").append(selectDom);

                var $dropdown = $instanceWrapper.find("[name='" + dropdown.name + "']");
                if (window.Select2 !== undefined) {
                    $dropdown.select2();
                }


                $dropdown.change(function () {
                    var $selector = $(this);
                    settings.filterParams[$selector.attr("name")] = $selector.val();
                    $instance.appTable({reload: true, filterParams: settings.filterParams});
                });
            });
        }


        var undoHandler = function (eventData) {
            $('<a class="undo-delete" href="javascript:;"><strong>Undo</strong></a>').insertAfter($(eventData.alertSelector).find(".app-alert-message"));
            $(eventData.alertSelector).find(".undo-delete").bind("click", function () {
                $(eventData.alertSelector).remove();
                appLoader.show();
                $.ajax({
                    url: eventData.url,
                    type: 'POST',
                    dataType: 'json',
                    data: {id: eventData.id, undo: true},
                    success: function (result) {
                        appLoader.hide();
                        if (result.success) {
                            $instance.appTable({newData: result.data});
                            //fire success callback
                            settings.onUndoSuccess(result);
                        }
                    }
                });
            });
        };


        var deleteHandler = function (e) {
            appLoader.show();
            var $target = $(e.currentTarget),
                    url = $target.attr('data-action-url'),
                    id = $target.attr('data-id');
            $.ajax({
                url: url,
                type: 'POST',
                dataType: 'json',
                data: {id: id},
                success: function (result) {
                    if (result.success) {
                        var tr = $target.closest('tr'),
                                table = $instance.DataTable();
                        oTable.fnDeleteRow(table.row(tr).index());
                        var alertId = appAlert.warning(result.message, {duration: 20000});

                        //fire success callback
                        settings.onDeleteSuccess(result);

                        //bind undo selector
                        undoHandler({
                            alertSelector: alertId,
                            url: url,
                            id: id
                        });
                    } else {
                        appAlert.error(result.message);
                    }
                    appLoader.hide();
                }
            });
        };

        window.InstanceCollection = window.InstanceCollection || {};
        window.InstanceCollection["#" + $(this).attr('id')] = settings;



        $('body').find($instance).on('click', '[data-action=delete]', deleteHandler);



        $.fn.dataTableExt.oApi.getSettings = function (oSettings) {
            return oSettings;
        };

        $.fn.dataTableExt.oApi.fnReloadAjax = function (oSettings, filterParams) {
            this.fnClearTable(this);
            this.oApi._fnProcessingDisplay(oSettings, true);
            var that = this;
            $.ajax({
                url: oSettings.ajax.url,
                type: "POST",
                dataType: "json",
                data: filterParams,
                success: function (json) {
                    /* Got the data - add it to the table */
                    for (var i = 0; i < json.data.length; i++) {
                        that.oApi._fnAddData(oSettings, json.data[i]);
                    }

                    oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
                    that.fnDraw(that);
                    that.oApi._fnProcessingDisplay(oSettings, false);
                }
            });
        };
        $.fn.dataTableExt.oApi.fnAddRow = function (oSettings, data) {
            this.oApi._fnAddData(oSettings, data);
            this.fnDraw(this);
        };
    };
})(jQuery);

// appAlert
(function (define) {
    define(['jquery'], function ($) {
        return (function () {
            var appAlert = {
                info: info,
                success: success,
                warning: warning,
                error: error,
                options: {
                    container: "body", // append alert on the selector
                    duration: 0, // don't close automatically,
                    showProgressBar: true, // duration must be set
                    clearAll: true, //clear all previous alerts
                    animate: true //show animation
                }
            };

            return appAlert;

            function info(message, options) {
                this._settings = _prepear_settings(options);
                this._settings.alertType = "info";
                _show(message);
                return "#" + this._settings.alertId;
            }

            function success(message, options) {
                this._settings = _prepear_settings(options);
                this._settings.alertType = "success";
                _show(message);
                return "#" + this._settings.alertId;
            }

            function warning(message, options) {
                this._settings = _prepear_settings(options);
                this._settings.alertType = "warning";
                _show(message);
                return "#" + this._settings.alertId;
            }

            function error(message, options) {
                this._settings = _prepear_settings(options);
                this._settings.alertType = "error";
                _show(message);
                return "#" + this._settings.alertId;
            }

            function _template(message) {
                var className = "info";
                if (this._settings.alertType === "error") {
                    className = "danger";
                } else if (this._settings.alertType === "success") {
                    className = "success";
                } else if (this._settings.alertType === "warning") {
                    className = "warning";
                }

                if (this._settings.animate) {
                    className += " animate";
                }

                return '<div id="' + this._settings.alertId + '" class="app-alert alert alert-' + className + ' alert-dismissible " role="alert">'
                        + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
                        + '<div class="app-alert-message">' + message + '</div>'
                        + '<div class="progress">'
                        + '<div class="progress-bar progress-bar-' + className + ' hide" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%">'
                        + '</div>'
                        + '</div>'
                        + '</div>';
            }

            function _prepear_settings(options) {
                if (!options)
                    var options = {};
                options.alertId = "app-alert-" + _randomId();
                return this._settings = $.extend({}, appAlert.options, options);
            }

            function _randomId() {
                var id = "";
                var keys = "abcdefghijklmnopqrstuvwxyz0123456789";
                for (var i = 0; i < 5; i++)
                    id += keys.charAt(Math.floor(Math.random() * keys.length));
                return id;
            }

            function _clear() {
                if (this._settings.clearAll) {
                    $("[role='alert']").remove();
                }
            }

            function _show(message) {
                _clear();
                var container = $(this._settings.container);
                if (container.length) {
                    if (this._settings.animate) {
                        //show animation
                        setTimeout(function () {
                            $(".app-alert").animate({
                                opacity: 1,
                                right: "40px"
                            }, 500, function () {
                                $(".app-alert").animate({
                                    right: "15px"
                                }, 300);
                            });
                        }, 20);
                    }

                    $(this._settings.container).prepend(_template(message));
                    _progressBarHandler();
                } else {
                    console.log("appAlert: container must be an html selector!");
                }
            }

            function _progressBarHandler() {
                if (this._settings.duration && this._settings.showProgressBar) {
                    var alertId = "#" + this._settings.alertId;
                    var $progressBar = $(alertId).find('.progress-bar');

                    $progressBar.removeClass('hide').width(0);
                    var css = "width " + this._settings.duration + "ms ease";
                    $progressBar.css({
                        WebkitTransition: css,
                        MozTransition: css,
                        MsTransition: css,
                        OTransition: css,
                        transition: css
                    });

                    setTimeout(function () {
                        if ($(alertId).length > 0) {
                            $(alertId).remove();
                        }
                    }, this._settings.duration);
                }
            }
        })();
    });
}(function (d, f) {
    window['appAlert'] = f(window['jQuery']);
}));


(function (define) {
    define(['jquery'], function ($) {
        return (function () {
            var appLoader = {
                show: show,
                hide: hide,
                options: {
                    container: 'body',
                    zIndex: "auto",
                    css: "",
                }
            };

            return appLoader;

            function show(options) {
                var $template = $("#app-loader");
                this._settings = _prepear_settings(options);
                if (!$template.length) {
                    var $container = $(this._settings.container);
                    if ($container.length) {
                        $container.append('<div id="app-loader" class="app-loader" style="z-index:' + this._settings.zIndex + ';' + this._settings.css + '"><div class="loading"></div></div>');
                    } else {
                        console.log("appLoader: container must be an html selector!");
                    }

                }
            }

            function hide() {
                var $template = $("#app-loader");
                if ($template.length) {
                    $template.remove();
                }
            }

            function _prepear_settings(options) {
                if (!options)
                    var options = {};
                return this._settings = $.extend({}, appLoader.options, options);
            }
        })();
    });
}(function (d, f) {
    window['appLoader'] = f(window['jQuery']);
}));

/*prepare html form data for suitable ajax submit*/
function encodeAjaxPostData(html) {
    html = replaceAll("=", "~", html);
    html = replaceAll("&", "^", html);
    return html;
}

//replace all occurrences of a string
function replaceAll(find, replace, str) {
    return str.replace(new RegExp(find, 'g'), replace);
}


(function (define) {
    define(['jquery'], function ($) {
        return (function () {
            var appContentModal = {
                init: init,
                destroy: destroy,
                options: {
                    url: "",
                    css: "",
                    sidebar: true
                }
            };

            return appContentModal;

            function escKeyEvent(e) {
                if (e.keyCode === 27) {
                    destroy();
                }
            }

            function init(options) {
                this._settings = _prepear_settings(options);
                _load_template(this._settings);
            }

            function destroy() {
                $(".app-modal").remove();
                $(document).unbind("keyup", escKeyEvent);
                if (typeof appModalXhr !== 'undefined') {
                    appModalXhr.abort();
                }
            }

            function _prepear_settings(options) {
                if (!options)
                    options = {};

                return this._settings = $.extend({}, appLoader.options, options);
            }

            function _load_template(settings) {

                var sidebar = "<div class='app-modal-sidebar hidden-xs'>\
                                        <div class='app-modal-close'><span>&times;</span></div>\
                                        <div class='app-moadl-sidebar-scrollbar'>\
                                            <div class='app-modal-sidebar-area'>\
                                            </div>\
                                        </div>\
                                    </div>";
                var controlIcon = "<i class='fa fa-expand expand hidden-xs'></i>";

                if (settings.sidebar === false) {
                    sidebar = "";
                    controlIcon = "<div class='app-modal-close app-modal-fixed-close-button'><span>&times;</span></div>";
                }

                var template = "<div class='app-modal loading'>\
                                <i class='fa fa-compress compress'></i>\
                                <div class='app-modal-body'>\
                                    <div class='app-modal-content'>" + controlIcon +
                        "<div class='hide app-modal-close'><span>&times;</span></div>\
                                        <div class='app-modal-content-area'>\
                                        </div>\
                                    </div>" + sidebar +
                        "</div>\
                            </div>";
                destroy();
                $("body").prepend(template);

                if ($.fn.mCustomScrollbar) {
                    $('.app-moadl-sidebar-scrollbar').mCustomScrollbar({setHeight: $(window).height() - 60, theme: "minimal-dark", autoExpandScrollbar: true});
                }

                $(".expand").click(function () {
                    $(".app-modal").addClass("full-content");
                });

                $(".compress").click(function () {
                    $(".app-modal").removeClass("full-content");
                });
                $(".app-modal-close").click(function () {
                    destroy();
                });
                $(document).bind("keyup", escKeyEvent);
                appLoader.show({container: '.app-modal', css: "top:35%; right:48%;"});

                appModalXhr = $.ajax({
                    url: settings.url || "",
                    data: {},
                    cache: false,
                    type: 'POST',
                    success: function (response) {
                        var $content = $(response);
                        $(".app-modal-content-area").html($content.find(".app-modal-content").html());
                        $(".app-modal-sidebar-area").html($content.find(".app-modal-sidebar").html());
                        $content.remove();
                        $(".app-modal").removeClass("loading");
                        appLoader.hide();
                    },
                    statusCode: {
                        404: function () {
                            appContentModal.destroy();
                            appAlert.error("404: Page not found.");
                        }
                    },
                    error: function () {
                        appContentModal.destroy();
                        appAlert.error("500: Internal Server Error.");
                    }
                });

            }
        })();
    });
}(function (d, f) {
    window['appContentModal'] = f(window['jQuery']);
}));

//custom app form controller
(function ($) {
    $.fn.appDateRange = function (options) {

        var defaults = {
            dateRangeType: "yearly",
            filterParams: {},
            onChange: function (dateRange) {
            },
            onInit: function (dateRange) {
            }
        };
        var settings = $.extend({}, defaults, options);
        settings._inputDateFormat = "YYYY-MM-DD";

        this.each(function () {

            var $instance = $(this);

            var dom = '<div class="ml15">'
                    + '<button data-act="prev" class="btn btn-default date-range-selector"><i class="fa fa-chevron-left"></i></button>'
                    + '<button data-act="datepicker" class="btn btn-default" style="margin: -1px"></button>'
                    + '<button data-act="next"  class="btn btn-default date-range-selector"><i class="fa fa-chevron-right"></i></button>'
                    + '</div>';
            $instance.append(dom);

            var $datepicker = $instance.find("[data-act='datepicker']"),
                    $dateRangeSelector = $instance.find(".date-range-selector");

            if (settings.dateRangeType === "yearly") {
                var inityearSelectorText = function ($elector) {
                    $elector.html(moment(settings.filterParams.start_date).format("YYYY"));
                };

                inityearSelectorText($datepicker);

                //bind the click events
                $datepicker.datepicker({
                    format: "YYYY-MM",
                    viewMode: "years",
                    minViewMode: "years",
                    autoclose: true,
                    language: "custom",
                }).on('changeDate', function (e) {
                    var date = moment(e.date).format(settings._inputDateFormat),
                            year = moment(date).format("YYYY");
                    settings.filterParams.start_date = year + "-01-01";
                    settings.filterParams.end_date = year + "-12-31";
                    settings.filterParams.year = year;
                    inityearSelectorText($datepicker);
                    settings.onChange(settings.filterParams);
                });

                //init default date
                var year = moment().format("YYYY");
                settings.filterParams.start_date = year + "-01-01";
                settings.filterParams.end_date = year + "-12-31";
                settings.filterParams.year = year;
                settings.onInit(settings.filterParams);


                $dateRangeSelector.click(function () {
                    var type = $(this).attr("data-act"),
                            startDate = moment(settings.filterParams.start_date),
                            endDate = moment(settings.filterParams.end_date);
                    if (type === "next") {
                        startDate = startDate.add(1, 'years').format(settings._inputDateFormat);
                        endDate = endDate.add(1, 'years').format(settings._inputDateFormat);
                    } else if (type === "prev") {
                        startDate = startDate.subtract(1, 'years').format(settings._inputDateFormat);
                        endDate = endDate.subtract(1, 'years').format(settings._inputDateFormat);
                    }

                    settings.filterParams.start_date = startDate;
                    settings.filterParams.end_date = endDate;
                    settings.filterParams.year = moment(startDate).format("YYYY");

                    inityearSelectorText($datepicker);
                    settings.onChange(settings.filterParams);
                });


            }
        });
    };
})(jQuery);



//find and replace all search string
replaceAllString = function (string, find, replaceWith) {
    return string.split(find).join(replaceWith);
};

//convert a number to curency format
toCurrency = function (number, currencySymbol) {
    number = parseFloat(number).toFixed(2);
    if (!currencySymbol) {
        currencySymbol = AppHelper.settings.currencySymbol;
    }
    var result = number.replace(/(\d)(?=(\d{3})+\.)/g, "$1,");

    if (AppHelper.settings.decimalSeparator === ",") {
        result = replaceAllString(result, ".", "_");
        result = replaceAllString(result, ",", ".");
        result = replaceAllString(result, "_", ",");
    }
    if (currencySymbol === "none") {
        currencySymbol = "";
    }

    return  currencySymbol + "" + result;
};


calculateDatatableTotal = function (instance, columnNumber, valueModifier, currentPage) {
    var api = instance.api(),
            columnOption = {};
    if (currentPage) {
        columnOption = {page: 'current'};
    }
    return api.column(columnNumber, columnOption).data()
            .reduce(function (previousValue, currentValue) {
                if (valueModifier) {
                    return previousValue + valueModifier(currentValue);
                } else {
                    return previousValue + currentValue;
                }
            }, 0);
};

// rmove the formatting to get integer data
unformatCurrency = function (currency) {
    currency = currency.toString();
    if (currency) {
        currency = currency.replace(/[^0-9.,]/g, '');
        if (currency.indexOf(".") == 0 || currency.indexOf(",") == 0) {
            currency = currency.slice(1);
        }

        if (AppHelper.settings.decimalSeparator === ",") {
            currency = replaceAllString(currency, ".", "");
            currency = replaceAllString(currency, ",", ".");
        } else {
            currency = replaceAllString(currency, ",", "");
        }
        currency = currency * 1;
    }
    if (currency) {
        return currency;
    }
    return 0;
};


// convert seconds to hours:minutes:seconds format
secondsToTimeFormat = function (sec) {
    var sec_num = parseInt(sec, 10),
            hours = Math.floor(sec_num / 3600),
            minutes = Math.floor((sec_num - (hours * 3600)) / 60),
            seconds = sec_num - (hours * 3600) - (minutes * 60);
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    var time = hours + ':' + minutes + ':' + seconds;
    return time;
};


