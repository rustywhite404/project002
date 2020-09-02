package net.ivyro.zian.board;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class ListenerSample extends JFrame{

	ListenerSample(){
		setTitle("이벤트 리스너 작성");
		setLayout(new FlowLayout());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JButton btn = new JButton("Action");
		MyActionListener listener = new MyActionListener();
		btn.addActionListener(listener);
		add(btn);
		setSize(300,150);
		setVisible(true);
		
	}
	public static void main(String[] args){
		new ListenerSample();
	}
}

class MyActionListener implements ActionListener{

	public void actionPerformed(ActionEvent e) {
		JButton b = (JButton)e.getSource();
		if(b.getText().equals("action"))
			b.setText("액션");
		else
			b.setText("Action");
	}
	
	
}