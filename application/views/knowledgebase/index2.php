    <?php
    load_css(array(
        "assets/css/style.css",
    ));

    ?>

    <script>
        $(document).ready(function(){
            var searchterm = $('#searchval').val();
            $("#searchbtn").on('click', function(){
                window.location.href="/knowledge_base/search?term="+searchterm;
            })
        })
    </script>
<div id="page-content" class="p20 row">
    <!-- SEARCH FIELD AREA -->
    <div class="searchfield bg-hed-six">
        <div class="container" style="padding-top: 20px; padding-bottom: 20px;">
            <div class="row text-center margin-bottom-20">
                <h1 class="white"> Knowledge Base</h1>
            </div>
            <br>
            <div class="row search-row">
                <input type="text" id="searchval" class="search" placeholder="Search Knowledgebase ...">
                <a id="searchbtn" class="buttonsearch btn btn-info btn-lg" >Search</a>
            </div>
        </div>
    </div>

    <!-- MAIN SECTION -->
    <div class="container featured-area-default padding-30">
        <div class="row">
            <div class="col-md-8 padding-20">
                <!-- ARTICLE CATEGORIES SECTION -->
                <div class="row">
                    <div class="col-md-12">
                        <hr class="style-three">
                        <div class="row">

                            <?php
                            foreach ($types as $key=>$type){
                                ?>
                                <div class="col-md-6 margin-bottom-20">
                                    <div class="fat-heading-abb">
                                        <a href="#"><i class="fa fa-folder"></i>
                                            <?php
                                            echo  $type->name;
                                            ?>
                                            <span class="cat-count"><?php echo count($type->knowledges) ?></span></a>
                                    </div>
                                    <div class="fat-content-small padding-left-30">
                                        <ul>
                                            <?php
                                            foreach ($type->knowledges as $key=>$knowledge){
                                      ?>
                                                <li> <a href="/knowledge_base/viewknowledge/<?php echo $knowledge->id ?>"><i class="fa fa-file-text-o"></i> <?php echo $knowledge->title?></a> </li>
                                                <?php
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>
                            <?php

                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 padding-20">
                <div class="row margin-bottom-30">
                    <div class="col-md-12 ">
                        <div class="support-container">
                            <h2 class="support-heading">Need more Support?</h2>
                        <a href="/tickets">Create an ICT TICKET</a> for further help.
                        </div>
                    </div>
                </div>
            </div>
            <!-- END SIDEBAR STUFF -->
        </div>
    </div>
    <!-- END MAIN SECTION -->
</div>


