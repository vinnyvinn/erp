<template>
    <div class="col-md-12" v-if="dataloaded">
        <div class="page-title mb15 clearfix">
            <h1>
                <i class="fa fa-th-large" title="Open"></i>
                {{customer_name}} Checks</h1>
            <div class="title-button-group" id="project-timer-box">
                <a @click="backtocustomers" class="btn btn-sm btn-info"><i
                        class="fa fa fa-chevron-left"></i> Back to daily tasks</a>
                <span class="dropdown inline-block">
                            <button class="btn btn-default dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                                <i class='fa fa-cogs'></i> Actions
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                    <li role="presentation">
                                        <a>
                                            <i class='fa fa-check-circle'></i>  Close Task
                                        </a>
                                    </li>
                                   <li role="presentation">
                                        <a>
                                            <i class='fa fa-check-circle'></i>  Escalate task
                                        </a>
                                    </li>
                                 <li role="presentation">
                                        <a>
                                            <i class='fa fa-check-circle'></i>  Add to knowledgebase
                                        </a>
                                    </li>


                            </ul>
                        </span>
            </div>
        </div>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade active in">
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel">
                            <div class="tab-title clearfix">
                                <h4>Last Checks</h4>
                            </div>
                            <div class="row">
                                <vue-table :fields="columns"
                                           track-by="id"
                                           class="table [css.tableClass]"
                                           :api-url="url"
                                           ref="vuetable"
                                           :noDataTemplate="noDataTemplate"
                                           table-class="table table-bordered table-striped table-hover"
                                           data-path="data"
                                           pagination-path="links"
                                           @vuetable:pagination-data="onPaginationData"
                                           @vuetable:loading="onStartLoading"
                                           @vuetable:loaded="onLoaded"

                                >
                                    <template slot="actions" slot-scope="props">
                                        <div class="table-button-container">
                                            <a @click="removeitem(props.rowData)"><i class="fa fa fa-close"></i> </a>
                                        </div>
                                    </template>

                                </vue-table>
                                <vuetable-pagination ref="pagination"
                                                     @vuetable-pagination:change-page="onChangePage"
                                ></vuetable-pagination>

                            </div>


                        </div>


                    </div>
                    <div class="col-md-6">
                        <div class="panel">
                            <div class="tab-title clearfix">
                                <h4>Last Checks</h4>
                            </div>
                            <div class="row">
                                <vue-table :fields="columns"
                                           track-by="id"
                                           class="table [css.tableClass]"
                                           :api-url="url"
                                           ref="vuetable"
                                           :noDataTemplate="noDataTemplate"
                                           table-class="table table-bordered table-striped table-hover"
                                           data-path="data"
                                           pagination-path="links"
                                           @vuetable:pagination-data="onPaginationData"
                                           @vuetable:loading="onStartLoading"
                                           @vuetable:loaded="onLoaded"

                                >
                                    <template slot="actions" slot-scope="props">
                                        <div class="table-button-container">
                                            <a @click="removeitem(props.rowData)"><i class="fa fa fa-close"></i> </a>
                                        </div>
                                    </template>

                                </vue-table>
                                <vuetable-pagination ref="pagination"
                                                     @vuetable-pagination:change-page="onChangePage"
                                ></vuetable-pagination>

                            </div>


                        </div>

                    </div>
                </div>
            </div>

        </div>
        <modal name="customer_checks" @before-close="reloadTable" width="850" height="800px">
            <customer-check-form></customer-check-form>
        </modal>
    </div>

</template>
<script>
    import VuetablePagination from './../../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../../common/table/Vuetable.vue';
    import appdetails from '../../../../../helpers/appdetails'
    import columns from './viewfields';
    import CustomerCheckForm from './CheckForm.vue'

    export default {
        data: () => ({
            customer_name: '',
            dataloaded: false,
            showloading: false,
            columns: columns,
            url: appdetails.approoturl + '/customers/getCustomersChecks/' + localStorage.getItem('customer'),
        }),
        components: {
            VuetablePagination, VueTable,CustomerCheckForm
        },
        computed: {
            noDataTemplate() {
                return (this.showloading) ? 'Please wait getting all check records...' : 'No records exist perform checks'
            }
        },
        methods: {
            statusLabel (value) {
                console.log("value is", value);
                var label="";
                switch(+value){
                    case 0:{
                        label+='<span class="label label-success"><i class="glyphicon glyphicon-star"></i> Submitted</span>'
                        break;
                    }
                    case 1:{
                        label+='<span class="label label-danger"><i class="glyphicon glyphicon-star"></i> Not Submitted</span>'
                        break;
                    }
                    default:{
                        label+='<span class="label label-danger"><i class="glyphicon glyphicon-star"></i> Not Submitted</span>'
                        break;
                    }
                }

                return label;
            },
            performchecks(){
                this.$modal.show('customer_checks');

            },
            fetchCustomerdata() {
                this.dataloaded = false;
                this.$http.post('customers/getCustomer', {id: localStorage.getItem('customer')})
                    .then((res) => {
                        this.dataloaded = true;
                        this.customer_name = res.body.Name;
                    }, (err) => {
                        this.dataloaded = true;
                    });
            },
            removeitem(data) {
                this.$http.post('customers/delete_check', {id: localStorage.getItem('customer')})
                    .then((res) => {
                        this.$refs.vuetable.reload();
                    });
            },
            backtocustomers() {
                this.$emit('changedparentcust', 0);
            },
            onPaginationData(paginationData) {

                this.$refs.pagination.setPaginationData(paginationData);

            },
            reloadTable(){
                this.$refs.vuetable.reload();
            },
            onChangePage(page) {
                this.$refs.vuetable.changePage(page)
            },
            onStartLoading() {
                this.showloading = true;
            },
            onLoaded() {
                this.showloading = false;
            },
        },
        mounted() {
            //fetch project data from localstorage
            if (!localStorage.getItem('customer')) {
                this.$emit('changedparentcust', 0);
                return;
            }
            this.fetchCustomerdata();

        }
    }
</script>
<style>
    a {
        cursor: pointer;
    }
</style>