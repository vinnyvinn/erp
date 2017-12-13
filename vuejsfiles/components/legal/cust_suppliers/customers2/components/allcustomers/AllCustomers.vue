<template>
    <div class="panel clearfix">

    <div class="panel clearfix">
            <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white inner" role="tablist">
                <li class="title-tab"><h4 class="pl15 pt5 pr15">List of all customers</h4></li>
            </ul>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade active in" id="monthly-invoices">
                    <vue-table :fields="columns" track-by="DCLink" class="table [css.tableClass]"
                               :api-url="url"
                               ref="vuetable"
                               :noDataTemplate="noDataTemplate"
                               :sort-order="sortOrder"
                               table-class="table table-bordered table-striped table-hover"
                               data-path="data"
                               pagination-path="links"
                               @vuetable:pagination-data="onPaginationData"
                               @vuetable:loading="onStartLoading"
                               @vuetable:loaded="onLoaded"

                    ></vue-table>
                    <vuetable-pagination ref="pagination"
                                         @vuetable-pagination:change-page="onChangePage"
                    ></vuetable-pagination>

                </div>
                <div role="tabpanel" class="tab-pane fade" id="yearly-invoices"></div>
            </div>
        </div>
    </div>

</template>
<script>
    import columns from './fields';
    import VuetablePagination from './../../../../../common/table/VuetablePagination.vue'
    import VueTable from './../../../../../common/table/Vuetable.vue';
    import appdetails from '../../../../../../helpers/appdetails'
    export default {
        data:()=>({
            data:0,
            columns:columns,
            url:appdetails.approoturl+'/customers/list_customers',
            sortOrder: [{
                field: 'name',
                direction: 'asc'
            }],
            showloading:false
        }),
        computed:{
          noDataTemplate(){
              return (this.showloading)?'Please wait getting all customers...':'No customers exist add some from SAGE'
          }
        },
        components:{
            VuetablePagination,VueTable
        },
        methods:{
          fetchcustomers(){
              this.$emit('customerchanged', false);
              this.$http.get('customers/list_customers')
                  .then((res)=>{
                      this.$emit('customerchanged', true);
                  },(err)=>{
                      this.$emit('customerchanged', false);
                  });
          },
            onPaginationData(paginationData) {

                this.$refs.pagination.setPaginationData(paginationData);

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

        mounted(){
            this.fetchcustomers();
        }

    }
</script>