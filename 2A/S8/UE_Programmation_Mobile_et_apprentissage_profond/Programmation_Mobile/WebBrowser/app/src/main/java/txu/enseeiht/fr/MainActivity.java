package txu.enseeiht.fr;

import static android.content.Intent.ACTION_VIEW;

import androidx.appcompat.app.AppCompatActivity;

import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.widget.*;
import android.os.Bundle;
import android.content.Intent;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "Browser Activity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.d( TAG, "OnCreate() called!" );
        Button btn = findViewById(R.id.button2);
        EditText ref = findViewById(R.id.editTextTextMultiLine2);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i = new Intent(ACTION_VIEW, Uri.parse(ref.getText().toString()));
                startActivity(i);
            }
        });
    }
}