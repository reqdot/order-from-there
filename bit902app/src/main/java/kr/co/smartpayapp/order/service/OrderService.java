package kr.co.smartpayapp.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface OrderService {
	public void registOrder(ArrayList<HashMap<String,String>> order) throws Exception;
}
