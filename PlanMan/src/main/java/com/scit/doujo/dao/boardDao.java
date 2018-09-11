package com.scit.doujo.dao;

import java.util.List;

import com.scit.doujo.vo.board;

public interface boardDao {

   int insertBoard(board board);
   List<board> selectAllBoard(String userid);
}