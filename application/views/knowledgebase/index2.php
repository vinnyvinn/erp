<div id="page-content" class="p20 row">

    <!-- Start of Search Wrapper -->
    <div class="search-area-wrapper">
        <div class="search-area container">
            <h3 class="search-header">Have a Question?</h3>
            <p class="search-tag-line">If you have any question you can ask below or enter what you are looking for!</p>

            <form id="search-form" class="search-form clearfix" method="get" action="home-categories-description.html#" autocomplete="off">
                <input class="search-term required" type="text" id="s" name="s" placeholder="Type your search terms here" title="* Please enter a search term!" />
                <input class="search-btn" type="submit" value="Search" />
                <div id="search-error-container"></div>
            </form>
        </div>
    </div>
    <!-- End of Search Wrapper -->

    <!-- Start of Page Container -->
    <div class="page-container">
        <div class="container">
            <div class="row">

                <div class="row home-category-list-area">
                    <div class="span8">
                        <h2>Categories</h2>
                    </div>
                </div>

                <div class="row-fluid top-cats">

                    <section class="span4">
                        <h4 class="category"><a href="home-categories-description.html#">WordPress for Beginners</a></h4>
                        <div class="category-description">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat</p>
                        </div>
                    </section>

                    <section class="span4">
                        <h4 class="category"><a href="home-categories-description.html#">Designing in WordPress</a></h4>
                        <div class="category-description">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet</p>
                        </div>
                    </section>

                    <section class="span4">
                        <h4 class="category"><a href="home-categories-description.html#">Theme Development</a></h4>
                        <div class="category-description">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna</p>
                        </div>
                    </section>
                </div>
                <div class="row-fluid top-cats">

                    <section class="span4">
                        <h4 class="category"><a href="home-categories-description.html#">Website Dev</a></h4>
                        <div class="category-description">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam</p>
                        </div>
                    </section>

                    <section class="span4">
                        <h4 class="category">
                            <a href="home-categories-description.html#">WordPress Plugins</a></h4>
                        <div class="category-description">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore</p>
                        </div>
                    </section>

                    <section class="span4">
                        <h4 class="category"><a href="home-categories-description.html#">Advanced Techniques</a></h4>
                        <div class="category-description"><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut</p>
                        </div>
                    </section>
                </div>

                <!-- start of page content -->
                <div class="span8 page-content">

                    <!-- Basic Home Page Template -->
                    <div class="row separator">
                        <section class="span8 articles-list">
                            <h3>Latest Articles</h3>
                            <ul class="articles">
                                <li class="article-entry standard">
                                    <h4><a href="single.html">Integrating WordPress with Your Website</a></h4>
                                    <span class="article-meta">25 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>
                                    <span class="like-count">66</span>
                                </li>
                                <li class="article-entry standard">
                                    <h4><a href="single.html">WordPress Site Maintenance</a></h4>
                                    <span class="article-meta">24 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Website Dev">Website Dev</a></span>
                                    <span class="like-count">15</span>
                                </li>
                                <li class="article-entry video">
                                    <h4><a href="single.html">Meta Tags in WordPress</a></h4>
                                    <span class="article-meta">23 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Website Dev">Website Dev</a></span>
                                    <span class="like-count">8</span>
                                </li>
                                <li class="article-entry image">
                                    <h4><a href="single.html">WordPress in Your Language</a></h4>
                                    <span class="article-meta">22 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Advanced Techniques">Advanced Techniques</a></span>
                                    <span class="like-count">6</span>
                                </li>
                                <li class="article-entry standard">
                                    <h4><a href="single.html">Know Your Sources</a></h4>
                                    <span class="article-meta">22 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Website Dev">Website Dev</a></span>
                                    <span class="like-count">2</span>
                                </li>
                                <li class="article-entry standard">
                                    <h4><a href="single.html">Validating a Website</a></h4>
                                    <span class="article-meta">21 Feb, 2013 in <a href="home-categories-description.html#" title="View all posts in Website Dev">Website Dev</a></span>
                                    <span class="like-count">3</span>
                                </li>
                            </ul>
                        </section>
                    </div>


                </div>
                <!-- end of page content -->


            </div>
        </div>
    </div>
    <!-- End of Page Container -->

    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Knowledge Base</h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("knowledge_base/knowledge_base_modal_form"), "<i class='fa fa-plus-circle'></i> Add Solutions ", array("class" => "btn btn-default", "title" => 'Add Solutions'));
                    ?>
                    <?php
                    echo modal_anchor(get_uri("knowledge_base/knowledge_base_types_modal_form"), "<i class='fa fa-plus-circle'></i> Add Types ", array("class" => "btn btn-default", "title" => 'Add Types'));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="documents" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>
    <?php
    ?>

    <script type="text/javascript">

        $(document).ready(function() {
            var types = <?php echo json_encode($types); ?>;
            const radioButtons = [];
            types.forEach(function(type,index){
                radioButtons.push({text:type.name, value:type.id, isChecked:index === 0})

            })

            $("#documents").appTable({
                source: '<?php echo_uri("knowledge_base/list_data") ?>',
                radioButtons: radioButtons,
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Type"},
                    {title: "Solution"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>




</div>


