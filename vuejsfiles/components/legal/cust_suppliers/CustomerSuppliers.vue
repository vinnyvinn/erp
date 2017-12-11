<template>
   <div class="row">
       <div class="col-md-2">
           <side-bar @changed="changedcmp"></side-bar>
       </div>
       <div class="col-md-10">
          <component :is="loadedcmp"></component>
       </div>
   </div>
</template>
<script>
    import SideBar from './layout/SideBar.vue'
    import CustomerCmp from './customers/Customers.vue';
    import SuppliersCmp from './suppliers/Suppliers.vue';
    export default{
        data:()=>({
            loadedcmp:CustomerCmp
        }),
        components:{
            SideBar,CustomerCmp,SuppliersCmp
        },
        methods:{
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
                    default:{
                        this.loadedcmp = CustomerCmp;
                        break;
                    }
                }
            }
        }
    }
</script>