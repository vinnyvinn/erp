<template>
    <div class="row">
    <div class="col-sm-4 col-md-offset-3">
        <!-- Category -->
        <div class="single category">
            <h3 class="side-title">Category</h3>
            <ul class="list-unstyled">
                <li><a @click="changedto('ict')" title="">Ict Reports <span class="pull-right rumba">open</span></a></li>
                <li><a href="" title="">Maintenance Reports <span class="pull-right rumba">open</span></a></li>
            </ul>
        </div>
    </div>
    </div>




</template>
<script>
    export default{
        methods:{
            changedto(){
                this.$emit('changedreports','ict')
            }
        }

    }
</script>
<style>
    .rumba{
        color:red;
    }
    .single {
        padding: 30px 15px;
        margin-top: 40px;
        background: #fcfcfc;
        border: 1px solid #f0f0f0; }
    .single h3.side-title {
        margin: 0;
        margin-bottom: 10px;
        padding: 0;
        font-size: 20px;
        color: #333;
        text-transform: uppercase; }
    .single h3.side-title:after {
        content: '';
        width: 60px;
        height: 1px;
        background: #ff173c;
        display: block;
        margin-top: 6px; }

    .single ul {
        margin-bottom: 0; }
    .single li a {
        color: #666;
        font-size: 14px;
        text-transform: uppercase;
        border-bottom: 1px solid #f0f0f0;
        line-height: 40px;
        display: block;
        text-decoration: none; }
    .single li a:hover {
        color: #ff173c; }
    .single li:last-child a {
        border-bottom: 0; }

    a{
        cursor:pointer
    }
</style>