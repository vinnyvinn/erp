<template>
    <ul class="nav nav-tabs vertical" role="tablist">
        <li role="presentation" :class="(active == 0)?'active':''"><a @click="changecmp(0)">Checklist Items</a></li>
        <li role="presentation" :class="(active == 1)?'active':''"><a @click="changecmp(1)">Daily ICT Tasks</a></li>
        <li role="presentation" :class="(active == 1)?'active':''"><a @click="changecmp(1)">ICT REPORTS</a></li>
    </ul>
</template>
<script>
    import appdetails from '../../../helpers/appdetails';
    export default{
     data:()=>({
            active:0
        }),
        methods:{
            changecmp(value){
                if(this.active != value){
                    this.active=value;
                    this.$emit('changed', value); //redraw the component only when the value is different
                }

            }
        }

    }
</script>
<style scoped>
    li a{
        cursor: pointer;
    }
</style>