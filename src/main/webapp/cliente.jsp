<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en" ng-app>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Loja APD3</title>
    <script data-require="angular.js@*" data-semver="1.2.13"
            src="http://code.angularjs.org/1.2.13/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
    <script src="js/jquery-2.0.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/app.js"></script>
    <meta name="generator" content="Bootply"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Loja APD3</a>
        </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="/loja/index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                <li><a href="/loja/cliente.jsp"><span class="glyphicon glyphicon-user"></span> Cadastro</a></li>
                <li><a href="/loja/sobre.jsp"><span class="glyphicon glyphicon-info-sign"></span> Sobre</a></li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>

<div class="container">
    <form id="formCliente" class="form-horizontal">
        <div class="form-group">
            <h3 >Buscar seus dados por e-mail: </h3>
			
            <label class="col-md-4 control-label" for="email">Email:</label>

            <div class="col-md-4">
            
                <input id="emailBusca" name="email" type="text" placeholder="jsilva@loja.apd3"
                       class="form-control input-md" required="true">
                <br/>
                <input type="button" class="btn btn-primary" value="Buscar" onclick="buscarDadosCliente()"/>
                <input type="button" class="btn btn-primary" data-toggle="collapse" data-target="#toggleNovo" value="Cadastrar Novo">
            </div>
        </div>
        <hr/>
        <br/>
        <div id="toggleNovo" class="collapse">
            <fieldset>
                <!-- Form Name -->
                <legend>Dados do cliente</legend>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="nome">Nome:</label>

                    <div class="col-md-4">
                        <input id="nome" name="nome" type="text" placeholder="Joao da Silva"
                               class="form-control input-md" required="true">

                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="email">Email:</label>

                    <div class="col-md-4">
                        <input id="email" name="email" type="text" placeholder="jsilva@loja.apd3"
                               class="form-control input-md" required="true">

                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="cpf">CPF</label>

                    <div class="col-md-4">
                        <input id="cpf" name="cpf" type="text" placeholder="XXX.XXX.XXX-XX"
                               class="form-control input-md" required="true">
                    </div>
                </div>
                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="btnCadastrar"></label>

                    <div class="col-md-4">
                        <button id="btnCadastrar" name="btnCadastrar" class="btn btn-primary"
                                onclick="incluiDadosCliente()">Enviar
                        </button>
                    </div>
                </div>
            </fieldset>
        </div>
    </form>
</div>
<!-- /.container -->
<!-- script references --></body>
</html>