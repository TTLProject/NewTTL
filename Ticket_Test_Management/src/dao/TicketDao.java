package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userbean.Userbean;

public class TicketDao {

	public static void insert(Userbean user) {
		
		try {
			
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("insert into tickettable(ticketid,ticketdescription,projectname,modulename,requirementname,assignedto,assignedby,dateofissue,status,username,empname,editstatus,testassignedto) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getTicketId());
			pstmt.setString(2, user.getTicketDescription());
			pstmt.setString(3, user.getProjectName());
			pstmt.setString(4, user.getModuleName());
			pstmt.setString(5, user.getRequirementName());
			pstmt.setString(6, user.getAssignedTo());
			pstmt.setString(7, user.getAssignedBy());
			pstmt.setString(8, user.getDateOfIssue());
			pstmt.setString(9, "Assign");
			pstmt.setString(10, user.getUsername());
			pstmt.setString(11, user.getEmpname());
			{
				PreparedStatement pstmt1=conn.prepareStatement("select * from registrationtable where username=?");
				pstmt1.setString(1, user.getUsername());
				ResultSet rs1 = pstmt1.executeQuery();
				if(rs1.next()) {
					
					user.setDesignation(rs1.getString("designation"));
					user.setDomain(rs1.getString("domain"));
				}
				
				
			}
			System.out.println(user.getDesignation());
			if(user.getDesignation().equals("executivequalityanalyst")||user.getDesignation().equals("executivesoftwaredeveloper")) {
				
				pstmt.setString(12, "approved");
			}else {
			
			pstmt.setString(12, "pending");
			}
			pstmt.setString(13, "0");
			int i=pstmt.executeUpdate();
			if(i>0) {
				PreparedStatement pstmt2 = conn.prepareStatement("select * from tickettable where id=(select MAX(id) from tickettable)");
				ResultSet rs1 = pstmt2.executeQuery();
				if(rs1.next()) {
					user.setId(rs1.getInt("id"));
				}
				System.out.println("insert success");
				user.setValid(true);
			}else {
				System.out.println("insert failed");
				user.setValid(false);
			}
			
			if(user.getDesignation().equals("executivequalityanalyst")||user.getDesignation().equals("executivesoftwaredeveloper")) {
				
	        if(user.getAssignedBy().equals(user.getAssignedTo())) {
			PreparedStatement pstmt1 = conn.prepareStatement("insert into tickettable1(username,id,ticketid) values(?,?,?) ");
			pstmt1.setString(1, user.getAssignedBy());
			pstmt1.setInt(2, user.getId());
			pstmt1.setString(3, user.getTicketId());
			pstmt1.executeUpdate();
	        }else {
	        	PreparedStatement pstmt1 = conn.prepareStatement("insert into tickettable1(username,id,ticketid) values(?,?,?) ");
				pstmt1.setString(1, user.getAssignedBy());
				pstmt1.setInt(2, user.getId());
				pstmt1.setString(3, user.getTicketId());
				pstmt1.executeUpdate();
				PreparedStatement pstmt3 = conn.prepareStatement("select * from tickettable1 where pid=(select MAX(pid) from tickettable1 where username=?) and username=?");
				pstmt3.setString(1, user.getAssignedTo());
				pstmt3.setString(2, user.getAssignedTo());
				ResultSet rs =pstmt3.executeQuery();
				PreparedStatement pstmt2 = conn.prepareStatement("insert into tickettable1(username,id,ticketid) values(?,?,?) ");
				pstmt2.setString(1, user.getAssignedTo());
				pstmt2.setInt(2, user.getId());
				if(rs.next()) {
				
				String s;
				s = rs.getString("ticketid");
				int n1 = s.length();
				//System.out.println(s.substring(3));
				int r = Integer.parseInt(s.substring(4)) + 1;
				String s2 = "TID-00" + r;
				//System.out.println(s2);
				//System.out.println(s2.length());
				int n2 = s2.length();
				int n3 = n1 + 1;

				if (n1 == n2) {
				pstmt2.setString(3, s2);
				}

				else if (n3 == n2) {
					int r1 = Integer.parseInt(s.substring(4)) + 1;
					String s3 = "TID-0" + r1;
					pstmt2.setString(3, s3);
				} else {
					int r2 = Integer.parseInt(s.substring(4)) + 1;
					String s4 = "TID-" + r2;
					pstmt2.setString(3, s4);
				}
				} else {
					String id = "TID-001";
					pstmt2.setString(3, id);
				}
				pstmt2.executeUpdate();
				}
	        }else {
	        	
	        	PreparedStatement pstmt1 = conn.prepareStatement("insert into tickettable1(username,id,ticketid) values(?,?,?) ");
				pstmt1.setString(1, user.getEmpname());
				pstmt1.setInt(2, user.getId());
				pstmt1.setString(3, user.getTicketId());
				pstmt1.executeUpdate();
	        	
	        	
	        	
	        }
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
