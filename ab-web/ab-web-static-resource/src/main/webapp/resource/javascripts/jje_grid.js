Grid = $.Class.create({
    tableId: '',
    initialize: function(tableId, model) {
        this.tableId = tableId;
        var baseModel = {
            datatype: "json",
            viewrecords: true,
            autowidth: true,
            rowNum:5,
            multiselect: true,
            jsonReader: {
                root:"results",
                page: "page", //当前页
                total: "total",  //总页数
                records: "records", //总记录数
                repeatitems : false
            },
            onPaging: function(pgButton) {
                $(tableId).jqGrid('setGridParam', {
                    postData: { search:false }
                });
            }
        };

        $(tableId).jqGrid($.extend(baseModel, model));

        for (var column in model.colModel) {
            if (column.hidden) {
                $(tableId).jqGrid('hideCol', column.name);
            }
        }
    },

    getSelectedIds: function () {
        return $(this.tableId).jqGrid('getGridParam', 'selarrrow');
    },

    queryByPost: function(data) {
        var base = {mtype: "POST", datatype: "json", search : true};
        $(this.tableId).jqGrid('setGridParam', $.extend(base, data)).trigger("reloadGrid", [{page:1}]);
    }
});

GridValidation = $.Class.create({
    initialize: function(grid, config) {
        this.grid = grid;
        this.config = config;
    },

    hasSelectedItem: function() {
        if (this.grid.getSelectedIds() == "") {
            alert(this.config.noSelectionMessage);
            return false;
        }
        return true;
    },

    checkValue: function(value, validValues) {
        var valuesArray = validValues.split(',');
        for (var i in valuesArray) {
            if (value == valuesArray[i]) {
                return true;
            }
        }
        return false;
    },

    validate: function(attribute, validValues, msg) {
        if (this.hasSelectedItem()) {
            var idArray = this.grid.getSelectedIds();
            for (var i in idArray) {
                var value = $(this.grid.tableId).getRowData(idArray[i])[attribute];
                if (!this.checkValue(value, validValues)) {
                    alert(msg);
                    return false;
                }
            }
        } else {
            return false;
        }
        return true;
    }

});