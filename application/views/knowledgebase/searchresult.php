<?php
/**
 * Created by PhpStorm.
 * User: geowan
 * Date: 2/6/18
 * Time: 7:34 PM
 */
load_css(array(
    "assets/css/style.css",
));
?>

<div class="breadcrumb-container">
    <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-backward"></i></a></li>
        <li><a href="/knowledge_base">Back to knowledgebase</a></li>
    </ol>
</div>

<?php
if(count($data)== 0){
    echo "<h1>NO RESULTS FOUND";
}else{
    ?>
    <div id="page-content" class="p20 row">

        <div class="container featured-area-default padding-30">
            <div class="row">
                <!-- ARTICLE OVERVIEW SECTION -->
                <div class="col-md-12 padding-20">
                    <div class="row">
                        <!-- ARTICLES -->
                        <div class="fb-heading">
                            <i class="fa fa-search"></i> Search Result
                            <h4 class="padding-left-35">
                                <small><?php echo count($data)?> result found</small>
                            </h4>
                        </div>
                        <hr class="style-three">
                        <?php
                        foreach ($data as $datum){
                            ?>

                            <div class="panel panel-default">
                                <div class="article-heading-abb">
                                    <a href="/knowledge_base/viewknowledge/<?php echo $datum->id?>"><i class="fa fa-pencil-square-o"></i> <?php echo $datum->title ?></a>
                                </div>
                                <div class="article-info">
                                    <div class="art-date"><a href="#"><i class="fa fa-calendar-o"></i>
                                            <?php
                                            echo date('d M Y', strtotime($datum->created_at))
                                            ?>
                                        </a></div>
                                </div>
                                <div class="article-content">
                                    <p class="block-with-text">
                                        <?php
                                        echo $datum->solution
                                        ?>

                                    </p>
                                </div>
                                <div class="article-read-more">
                                    <a href="<?php echo base_url();?>knowledge_base/viewknowledge/<?php echo $datum->id?>" class="btn btn-default btn-wide">Read more...</a>
                                </div>
                            </div>
                            <?php
                        }
                        ?>

                    </div>
                </div>
                <!-- END ARTICLES OVERVIEW SECTION-->
            </div>
        </div>
        <!-- END MAIN SECTION -->

    </div>

<?php
}
?>



