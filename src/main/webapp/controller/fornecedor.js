var fornecedorModule = angular.module("fornecedorModule",[]);

fornecedorModule.controller("FornecedorController", function($scope, $http){

	$http({
		  method: 'GET',
		  url: 'http://localhost:10131/gows/rest/gowservice/'
		}).then(function successCallback(response) {
	        $scope.Vendors = response.data;
	        $scope.status = response.status;
	 });
	
	$scope.addVendor = function addVendor() {
		$http({
			  method: 'POST',
			  url: 'http://localhost:10131/gows/rest/gowservice/create',
			  headers:{'Content-Type': 'application/json'},
			  data: $scope.vendor
			}).then(function successCallback(response) {
	            $scope.Vendors.push(response.data);
	            $scope.vendor = {};
	     });
	};
    
	//remove to the real data holder
    $scope.removeVendor = function removeVendor(row) {
    	$http({
			  method: 'DELETE',
			  url: 'http://localhost:10131/gows/rest/gowservice/remove/'+row.id,
			  headers:{'Content-Type': 'application/json'}
			}).then(function successCallback(response) {
				var index = $scope.Vendors.indexOf(row);
		        if (index !== -1) {
		            $scope.Vendors.splice(index, 1);
		        }
	    });
     }
    
    $scope.updateVendor = function () {
		$http({
			  method: 'PUT',
			  url: 'http://localhost:10131/gows/rest/gowservice/update',
			  headers:{'Content-Type': 'application/json'},
			  data: $scope.vendor
			}).then(function successCallback(response) {
	            $scope.vendor = response.data;
	     });
	};
	
	$scope.clear = function () {
		$scope.vendor = {};
	};
});