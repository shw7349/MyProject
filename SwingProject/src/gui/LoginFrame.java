package gui;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

public class LoginFrame extends JFrame {
	
	private JPanel contentPane;
	private JTextField tfUsername,tfPassword;
	private JButton loginBtn, joinBtn;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					LoginFrame frame = new LoginFrame();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public	LoginFrame() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(400, 300);
		setLocationRelativeTo(null);
		setVisible(true);
		
		contentPane		=	new JPanel();
		// padding설정
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblLogin	=	new JLabel("Username");
		// 위치 배치
		lblLogin.setBounds(41, 52, 69, 	35);
		contentPane.add(lblLogin);
		
		JLabel lblPassword	=	new JLabel("Password");
		lblLogin.setBounds(41, 103, 69, 35);
		contentPane.add(lblPassword);
		
		tfUsername			=	new JTextField();
		tfUsername.setBounds(157, 52, 176, 35);
		contentPane.add(tfUsername);
		tfUsername.setColumns(10);
		
		loginBtn			=	new	JButton("로그인");
		loginBtn.setBounds(108, 154, 106, 29);
		
		tfPassword			=	new	JTextField();
		tfPassword.setBounds(157, 103, 176, 35);
		contentPane.add(tfPassword);
		tfPassword.setColumns(10);
		
		joinBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JoinFrame frame	=	new JoinFrame();
			}
		});
		
		
	}
}
