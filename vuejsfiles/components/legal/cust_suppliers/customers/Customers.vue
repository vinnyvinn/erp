<template>
    <div>
        <component :is="loadedcmp" @changedparentcust="changedcmp"></component>
    </div>

</template>
<script>
    import AllCustomers from './components/allcustomers/AllCustomers.vue'
    import ViewCustomer from './components/allcustomers/View.vue'
    export default {
        data:()=>({
            loadedcmp:AllCustomers
        }),
        components:{
           AllCustomers,ViewCustomer
        },
        methods:{
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = AllCustomers;
                        break;
                    };
                    case 1:{
                        this.loadedcmp =ViewCustomer;
                        break;
                    }
                    default:{
                        this.loadedcmp = AllCustomers;
                        break;
                    }
                }
            }
        }

    }
</script>