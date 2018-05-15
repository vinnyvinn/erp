<template>
   <div class="row">
       <div class="col-md-2">
           <side-bar @changed="changedcmp"></side-bar>
       </div>
       <div class="col-md-10">
           <component :is="loadedcmp" @customerchanged="changedcustomer"></component>
       </div>
   </div>
</template>
<script>
    import SideBar from './layout/SideBar.vue'
    import CustomerCmp from './customers/Customers.vue';
    import SuppliersCmp from './suppliers/Suppliers.vue';
    import CheckItems from './checkitems/CheckItems.vue';

    export default{
        data:()=>({
            loadedcmp:CustomerCmp,
            showloading:false
        }),
        components:{
            SideBar,CustomerCmp,SuppliersCmp
        },
        methods:{
            changedcustomer(val){
              this.showloading=val;
            },
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = CustomerCmp;
                        break;
                    };
                    case 1:{
                        this.loadedcmp = SuppliersCmp;
                        break;
                    };
                    case 2:{
                        this.loadedcmp = CheckItems;
                        break;
                    }
                    default:{
                        this.loadedcmp = CustomerCmp;
                        break;
                    }
                }
            }
        }
    }
</script>