<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vanaraha.Web.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vanaraha</title>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap1.css" rel="stylesheet" />
    <link href="css/chosen.css" rel="stylesheet" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
</head>

<body ng-app="app">
    <form ng-controller="testController">
        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="Images/logo.png" />
                    </a>
                </div>
                <%-- <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Settings <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>--%>
                <!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container-fluid">
            <!-- Main component for a primary marketing message or call to action -->
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-4">
                        <div class="Options_Block Options_Block_Blue">
                            <div class="Options_Head clearfix ">
                                <span class="pull-left ">
                                    <img class="Head_Img" alt="" src="http://usepanda.com/img/source-icons/betaList.png" />
                                    <select ng-model="selectedItem1" ng-change="grid1ItemSelected($event)" style="width: 250px; visibility: hidden;" class="chosen-select" tabindex="1">
                                        <optgroup label="{{topic.Name}}" ng-repeat="topic in topics">
                                            <option ng-repeat='item in topic.Items' value="{{item.Id}}">{{item.Name}}</option>
                                        </optgroup>
                                    </select>
                                </span>
                                <span class="pull-right">
                                    <span class="glyphicon glyphicon-refresh Status_Text" aria-hidden="true" title="Refresh"></span>
                                </span>
                            </div>
                            <div class="Options_Body">
                                <ul class="Option_list color_bullet">
                                    <li>
                                        <div class="tcell w30"><a href="{{itemLink1.LinkUrl}}" target="_blank" class="list_bullet">{{$index + 1}}</a></div>
                                        <span class="listdrop tcell"><a href="{{itemLink1.LinkUrl}}" target="_blank" title="{{itemLink1.ItemLinkName}}">{{itemLink1.ItemLinkName}}</a></span>
                                        <div class="float_Button tcell">
                                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                            <span>{{itemLink1.TimeSince}}</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="Options_Block Options_Block_Green">
                            <div class="Options_Head clearfix ">
                                <span class="pull-left ">
                                    <img class="Head_Img" alt="" src="http://usepanda.com/img/source-icons/betaList.png" />
                                    <select ng-model="selectedItem2" ng-change="grid2ItemSelected()" style="width: 250px; visibility: hidden;" class="chosen-select" tabindex="1">
                                        <optgroup label="{{topic.Name}}" ng-repeat="topic in topics">
                                            <option ng-repeat='item in topic.Items' value="{{item.Id}}">{{item.Name}}</option>
                                        </optgroup>
                                    </select>
                                </span>
                                <span class="pull-right">
                                    <span class="glyphicon glyphicon-refresh Status_Text" aria-hidden="true" title="Refresh"></span>
                                </span>
                            </div>
                            <div class="Options_Body">
                                <ul class="Option_list color_bullet">
                                    <li class="clearfix" ng-repeat="itemLink2 in grid2ItemLinks">
                                        <a href="{{itemLink2.LinkUrl}}" target="_blank" class="list_bullet">{{$index + 1}}</a>
                                        <span class="listdrop"><a href="{{itemLink2.LinkUrl}}" target="_blank" title="{{itemLink2.ItemLinkName}}">{{itemLink2.ItemLinkName}}</a></span>
                                        <div class="float_Button tcell">
                                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                            <span>{{itemLink2.TimeSince}}
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="Options_Block Options_Block_Red">
                            <div class="Options_Head clearfix ">
                                <span class="pull-left ">
                                    <img class="Head_Img" alt="" src="http://usepanda.com/img/source-icons/betaList.png" />
                                    <select ng-model="selectedItem3" ng-change="grid3ItemSelected()" style="width: 250px; visibility: hidden;" class="chosen-select" tabindex="1">
                                        <optgroup label="{{topic.Name}}" ng-repeat="topic in topics">
                                            <option ng-repeat='item in topic.Items' value="{{item.Id}}">{{item.Name}}</option>
                                        </optgroup>
                                    </select>
                                </span>
                                <span class="pull-right">
                                    <span class="glyphicon glyphicon-refresh Status_Text" aria-hidden="true" title="Refresh"></span>
                                </span>
                            </div>
                            <div class="Options_Body">
                                <ul class="Option_list color_bullet">
                                    <li class="clearfix" ng-repeat="itemLink3 in grid3ItemLinks">
                                        <a href="{{itemLink3.LinkUrl}}" target="_blank" class="list_bullet">{{$index + 1}}</a>
                                        <span class="listdrop"><a href="{{itemLink3.LinkUrl}}" target="_blank" title="{{itemLink3.ItemLinkName}}">{{itemLink3.ItemLinkName}}</a></span>
                                        <div class="float_Button tcell">
                                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                            <span>{{itemLink3.TimeSince}}
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /container -->
    </form>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/chosen.jquery.js"></script>
    <script src="Scripts/app.js"></script>
    <script src="Scripts/services.js"></script>
    <script src="Scripts/controllers.js"></script>
    <script type="text/javascript">
        $(function () {
            //tooltip

            $('[data-toggle="tooltip"]').tooltip();

            //dropdown list
            //$(".chosen-select").chosen();

            //boxbodyheight
            boxbodyheight();
        });

        $(window).resize(function () {
            boxbodyheight();
        });

        function boxbodyheight() {
            var DynamicHt = $(window).height() - (parseInt($('.jumbotron').css('padding-top')) + $(".Options_Head").eq(0).outerHeight() + 10)
            $(".Options_Body").height(DynamicHt);
        }
    </script>

</body>
</html>
