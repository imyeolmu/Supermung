package com.supermm.service;

import java.util.List;

import com.supermm.model.Criteria;
import com.supermm.model.OrderCancelDTO;
import com.supermm.model.OrderDTO;
import com.supermm.model.OrderPageItemDTO;

public interface OrderService {
	
	//주문정보
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	//주문
	public void order(OrderDTO ord);

	//주문상품 리스트
	public List<OrderDTO> getOrderList(Criteria cri);
	
	//주문 총 갯수
	public int getOrderTotal(Criteria cri);
	
	//주문취소
	public void orderCancel(OrderCancelDTO dto);
	
}
