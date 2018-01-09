<template>
    <div>
        <component :is="loadedcmp" @changedparentcust="changedcmp"></component>
    </div>

</template>
<script>
    import AllSuppliers from './components/allsuppliers/AllSuppliers.vue'
    import ViewSupplier from './components/allsuppliers/View.vue'
    export default {
        data:()=>({
            loadedcmp:AllSuppliers
        }),
        components:{
            AllSuppliers,ViewSupplier
        },
        methods:{
            changedcmp(value){
                switch (value){
                    case 0:{
                        this.loadedcmp = AllSuppliers;
                        break;
                    };
                    case 1:{
                        this.loadedcmp =ViewSupplier;
                        break;
                    }
                    default:{
                        this.loadedcmp = AllSuppliers;
                        break;
                    }
                }
            }
        }

    }
</script>