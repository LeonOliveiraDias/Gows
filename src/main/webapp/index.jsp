<!doctype html>
<html lang="en" ng-app="fornecedorModule">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.8/angular.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="controller/fornecedor.js"></script>
    <title>Supply</title>
  </head>
  <body ng-controller="FornecedorController as vendor">
    <div class="row">
      <div class="col-3">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
          <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-vendors-list" role="tab" aria-controls="v-pills-home" aria-selected="true">Fornecedor</a>
        </div>
      </div>
      <div class="col-9">
      	<h1>Fornecedores</h1>
  		<h2><button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#v-vendors-add" ng-click="clear()">Adicionar</button></h2>
        <div class="tab-content" id="v-pills-tabContent">
          <div class="tab-pane fade show active" id="v-vendors-list" role="tabpanel" aria-labelledby="v-pills-home-tab">
            <table class="table table-bordered" st-table="displayedCollection" st-safe-src="Vendors">
              <thead>
                <tr>
                  <th scope="col">Código</th>
                  <th scope="col">Nome</th>
                  <th scope="col">CNPJ</th>
                  <th scope="col">E-mail</th>
                  <th scope="col">Ação</th>
                </tr>
              </thead>
              <tbody>
                <tr ng-repeat="row in Vendors">
                  <th>{{row.id}}</th>
                  <th>{{row.name}}</th>
                  <th>{{row.cnpj}}</th>
                  <th>{{row.email}}</th>
                  <th><button class="btn btn-primary" data-toggle="modal" data-target="#v-vendors-upd" ng-click="clear()">Alterar</button>
        			  <button class="btn btn-danger" ng-click="removeVendor(row)">Remover</button></th>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal fade" id="v-vendors-add" tabindex="-1" role="dialog" aria-labelledby="titleAdd" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="titleAdd">Novo Fornecedor</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-row">
						<div class="col-12">
					
						  <label for="vendorId">Código</label>
						  <input type="text" class="form-control" id="vendorId" ng-model="vendor.id" disabled="true">
					
						  <label for="vendorName">Nome</label>
						  <input type="text" class="form-control" id="vendorName" ng-model="vendor.name" required>
					
						  <label for="vendorEmail">E-mail</label>
						  <input type="text" class="form-control" id="vendorEmail" ng-model="vendor.email" required>
					
						  <label for="vendorNcpj">CNPJ</label>
						  <input type="text" class="form-control" id="vendorNcpj" ng-model="vendor.cnpj" required>
					
						  <label for="VendorComment">Comentários</label>
						  <textarea class="form-control" id="VendorComment" ng-model="vendor.comment"></textarea>
						</div>
					  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-success" ng-click="addVendor(row)">Salvar</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- modal de update -->
			<div class="modal fade" id="v-vendors-upd" tabindex="-1" role="dialog" aria-labelledby="titleUpd" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="titleUpd">Alterar Fornecedor</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
					  <div class="form-row">
						<div class="col-12">
					
						   <label for="vendorSelect">Fornecedor</label>
						   <select class="form-control" id="vendorSelect" ng-model="vendor" ng-options="x.name for x in Vendors" ></select>
					
						  <label for="vendorId">Código</label>
						  <input type="text" class="form-control" id="vendorId" value="{{vendor.id}}"  ng-model="vendor.id" disabled="true">
					
						  <label for="vendorName">Nome</label>
						  <input type="text" class="form-control" id="vendorName" value="{{vendor.name}}" ng-model="vendor.name" required>
					
						  <label for="vendorEmail">E-mail</label>
						  <input type="text" class="form-control" id="vendorEmail" value="{{vendor.email}}"  ng-model="vendor.email" required>
					
						  <label for="vendorNcpj">CNPJ</label>
						  <input type="text" class="form-control" id="vendorNcpj" value="{{vendor.cnpj}}" ng-model="vendor.cnpj" required>
					
						  <label for="VendorComment">Comentários</label>
						  <textarea class="form-control" id="VendorComment" value="{{vendor.comment}}" ng-model="vendor.comment"></textarea>
						</div>
					  </div>
					</form>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-success" ng-click="updateVendor()">Salvar Alterações</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
			      </div>
			    </div>
			  </div>
			</div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>