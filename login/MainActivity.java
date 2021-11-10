package com.example.loginform;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private EditText Name;
    private EditText Password;
    private TextView Info;
    private Button Login;
    private int counter = 3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Name = (EditText)findViewById(R.id.UserName);
        Password = (EditText)findViewById(R.id.password);
        Info = (TextView)findViewById(R.id.info);
        Login = (Button)findViewById(R.id.btnLogin);

        Info.setText("Number of attempts remaming is 3");

        Login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    validate(Name.getText().toString(),Password.getText().toString());
            }
        });
    }
    private void validate(String userName , String password){
        if(userName.equals("Admin") && password.equals("1234")){
            Intent intent = new Intent(MainActivity.this,MainActivity2.class);
            startActivity(intent);
        }else{
            counter--;

            Info.setText("Number of Attempts remaning" + String.valueOf(counter));

            if(counter == 0)
                Login.setEnabled(false);
        }
    }
}