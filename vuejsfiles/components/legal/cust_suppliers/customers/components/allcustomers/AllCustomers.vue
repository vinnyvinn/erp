<template>
    <div class="panel clearfix">

    <div class="panel clearfix">
        <div class="row">
            <div class="col-md-4">
                <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white inner" role="tablist">
                    <li class="title-tab"><h4 class="pl15 pt5 pr15">List of all customers</h4></li>

                </ul>
            </div>
        </div>


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

                    >
                        <template slot="actions" slot-scope="props">
                            <div class="table-button-container">
                                <a @click="open(props.rowData)">View</a>
                            </div>
                        </template>

                    </vue-table>
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
    import vSelect from "vue-select"
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
            showloading:false,
            selected: null,
            options: [{label:'Non Submitted', value:1},{label:'Partially Submitted', value:2},{label:'Submitted', value:3}]
        }),
        computed:{
          noDataTemplate(){
              return (this.showloading)?'Please wait getting all customers...':'No customers exist add some from SAGE'
          }
        },
        components:{
            VuetablePagination,VueTable,vSelect
        },
        methods:{
            statusLabel (value) {
                var label="";
              switch(+value){
                  case 0:{
                      label+='<span class="label label-success"><i class="glyphicon glyphicon-star"></i> Submitted</span>'
                      break;
                  }
                  case 1:{
                      label+='<span class="label label-primary"><i class="glyphicon glyphicon-star"></i> Partially Submitted</span>'
                        break;
                    }
                  case 2:{
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
          fetchcustomers(){
              this.$emit('customerchanged', false);
              this.$http.get('customers/list_customers')
                  .then((res)=>{
                      this.$emit('customerchanged', true);
                  },(err)=>{
                      this.$emit('customerchanged', false);
                  });
          },
            open(data){
                localStorage.setItem('customer', data.DCLink);
                this.$emit('changedparentcust', 1)
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
<style>
    .table-button-container a{
        cursor:pointer;

    }
</style>