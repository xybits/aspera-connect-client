<!DOCTYPE html>
<html lang="en">
<head>
    <title>Aspera Connect SDK + Servlet Example</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="${basePath}/assets/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="//d3gcli72yxqn2z.cloudfront.net/connect/v4/asperaweb-4.min.js"></script>
    <script type="text/javascript" src="//d3gcli72yxqn2z.cloudfront.net/connect/v4/connectinstaller-4.min.js"></script>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${basePath}/assets/app.css">
    <script src="${basePath}/assets/app.js"></script>
</head>

<body>
<h2 class="page-title">Aspera Connect SDK + Servlet Example</h2>

<!--Upload Area, note IDs match JavaScript for targeting-->
<div class="row" id="uploadArea">
    <div class="col-lg-5">
        <label for="upload-path">Upload File</label>
        <div class="input-group">
            <input type="text" class="form-control" disabled id="upload-path" placeholder="File Path">
            <span class="input-group-btn">
						<button class="btn btn-default" onclick="uploadFile();" id="upload-browse" type="button">Browse For File</button>
				  	</span>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-10">
        <div class="panel panel-default">
            <div class="panel-heading" id="currentDir">
                <div id="backDiv">
                    <a id="backButton" href="#" onclick="return false;"><span class="glyphicon glyphicon-menu-left"></span>Back</a>
                </div>
                <div style="display:inline-block; overflow:hidden;">
                    <!--Current Directory Name prints here-->
                    Browsing <span id="currentDirectory">&nbsp;</span>
                </div>
                <div id="pageMenuButton">
                    <a href="#" class="dropdown-toggle" id="pageMenuDrop" data-toggle="dropdown" aria-expanded="true"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="pageMenuDrop">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="createDirectory();return false;">Create Directory</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#" onclick="changeDirectory(jQuery('#currentDirectory').text());return false;">Refresh</a></li>
                    </ul>
                </div>
            </div>
            <div class="panel-body">
                <div class="searchArea">
                    <input type="text" class="form-control" id="search-term" placeholder="Search">
                    <a id="clearSearch" href="#" onclick="clearSearch(); return false;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </div>
            </div>
            <table class="table" id="fileListTable">
                <tr>
                    <!--Table Header Rows, make sure that generated table listings match pattern-->
                    <th class="type-col headerRow">Type<span class="glyphicon glyphicon-sort-by-attributes sort-icon" aria-hidden="true"></span></th>
                    <th class="name-col headerRow">Name<span class="glyphicon glyphicon-sort-by-attributes sort-icon" aria-hidden="true"></span></th>
                    <th class="size-col headerRow">Size<span class="glyphicon glyphicon-sort-by-attributes sort-icon" aria-hidden="true"></span></th>
                    <th class="mod-col headerRow">Last Modified</th>
                    <th class="act-col"><span class="glyphicon glyphicon-sort-by-attributes" id="sortIcon" aria-hidden="true"></span></th>
                </tr>
            </table>
            <!--Footer shows errors printed from failure(), this is optional-->
            <div class="panel-footer" id="log-data">Aspera Node</div>
        </div>
    </div>
</div>
<!--Starting directory. On page load get Starting Directory from Node and print in this hidden div-->
<div style="display:none;" id="startingDirectory">&nbsp;</div>
</body>
</html>
