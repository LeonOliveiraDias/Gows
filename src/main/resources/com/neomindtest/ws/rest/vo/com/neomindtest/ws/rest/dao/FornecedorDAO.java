package com.neomindtest.ws.rest.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neomindtest.ws.rest.vo.FornecedorVO;

public class FornecedorDAO {
	
	private static final Map<Integer, FornecedorVO> vendorMap = new HashMap<Integer, FornecedorVO>();
	static Integer id = 0;
	
	public static List<FornecedorVO> getAllVendors() {
        Collection<FornecedorVO> c = vendorMap.values();
        List<FornecedorVO> list = new ArrayList<FornecedorVO>();
        list.addAll(c);
        return list;
    }
	
	public static FornecedorVO getVendor(Integer vendorId) {
        return vendorMap.get(vendorId);
    }
	
	public static FornecedorVO create(FornecedorVO vendor) {
		id += 1;
		vendor.setID(id);
		vendorMap.put(vendor.getID(), vendor);
        return vendor;
    }
	
	public static FornecedorVO updateVendor(FornecedorVO vendor) {
		vendorMap.put(vendor.getID(), vendor);
        return vendor;
    }
 
    public static void deleteVendor(Integer vendorId) {
    	vendorMap.remove(vendorId);
    }
} 
