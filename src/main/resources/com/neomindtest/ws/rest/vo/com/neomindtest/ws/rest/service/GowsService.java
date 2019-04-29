package com.neomindtest.ws.rest.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.neomindtest.ws.rest.dao.FornecedorDAO;
import com.neomindtest.ws.rest.vo.FornecedorVO;

@Path("/gowservice")
public class GowsService {

	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public FornecedorVO create(FornecedorVO objFornecedor) {
        return FornecedorDAO.create(objFornecedor);
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<FornecedorVO> list(){
		return FornecedorDAO.getAllVendors();
	}
	
	@GET
	@Path("/buscaById/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public FornecedorVO buscaById(@PathParam("id") int id){
		return FornecedorDAO.getVendor(id);
	}
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public FornecedorVO update(FornecedorVO vendor) {
		return FornecedorDAO.updateVendor(vendor);
	}
	
	@DELETE
	@Path("/remove/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public void remove(@PathParam("id") int vendorId){
		FornecedorDAO.deleteVendor(vendorId);
	}
}
