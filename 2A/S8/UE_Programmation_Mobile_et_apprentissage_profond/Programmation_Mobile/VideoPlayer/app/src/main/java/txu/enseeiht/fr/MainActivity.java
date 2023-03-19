package txu.enseeiht.fr;

import static android.content.Intent.ACTION_PICK;
import static android.content.Intent.ACTION_VIEW;
import static android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.io.IOException;

public class MainActivity extends AppCompatActivity implements View.OnClickListener, SurfaceHolder.Callback {

    private static final int SELECT_VIDEO = 100;
    private Button btn_gal;
    private Button btn_pl;

    private Button btn_start;

    private Button btn_resume;
    private static final String TAG = "Intent Activity";

    private Uri uri;
    private SurfaceView surfaceView;
    private SurfaceHolder surfaceHolder;
    private MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn_gal = findViewById(R.id.btn_gallery);
        btn_pl = findViewById(R.id.btn_play);
        btn_start = findViewById(R.id.btn_start);
        btn_resume = findViewById(R.id.btn_resume);
        btn_pl.setEnabled(false);
        btn_gal.setOnClickListener(this);
        btn_pl.setOnClickListener(this);
        btn_start.setOnClickListener(this);
        btn_resume.setOnClickListener(this);

        // Custom Video Player
        mediaPlayer = new MediaPlayer();
        // recover the SurfaceView from resources
        surfaceView = (SurfaceView) findViewById( R.id.surfaceview );
        // Get the surfaceHolder from it
        surfaceHolder = surfaceView.getHolder();
        // and assign to it the call back this class implements
        surfaceHolder.addCallback( this );
        // this is a compatibility check, setType has been deprecated since HoneyComb,
        // it guarantees back compatibility
        if( Build.VERSION.SDK_INT < Build.VERSION_CODES.HONEYCOMB )
            surfaceHolder.setType( SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS );
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btn_gallery: {
                Intent i = new Intent(ACTION_PICK);
                i.setDataAndType(EXTERNAL_CONTENT_URI, "video/*");
                startActivityForResult(i, SELECT_VIDEO);
                break;
            }
            case R.id.btn_play: {
                Log.d( TAG, "Play called!" );
                Intent intent = new Intent(ACTION_VIEW, uri);
                startActivity(intent);
                break;
            }
            case R.id.btn_start: {
                try {
                    Log.d( TAG, "play from start!" );
                    mediaPlayer.reset();
                    mediaPlayer.setDataSource(getApplicationContext(), uri);
                    mediaPlayer.prepare();
                    mediaPlayer.start();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            case R.id.btn_resume: {
                if (mediaPlayer.isPlaying()) {
                    mediaPlayer.pause();
                } else {
                    mediaPlayer.start();
                }
            }
            default:{
                break;
            }
        }
    }
    
    @Override
    public void onActivityResult(int code, int result, Intent data) {
        super.onActivityResult(code, result, data);
        if (code == SELECT_VIDEO) {
            String str = data.getData().toString();
            EditText ref = findViewById(R.id.editTextTextMultiLine4);
            uri = Uri.parse(ref.getText().toString());
            uri = data.getData();
            ref.setText(str);
            btn_pl.setEnabled(true);
        }
    }

    @Override
    public void surfaceCreated(@NonNull SurfaceHolder surfaceHolder) {
        mediaPlayer.setDisplay(surfaceHolder);
    }

    @Override
    public void surfaceChanged(@NonNull SurfaceHolder surfaceHolder, int i, int i1, int i2) {

    }

    @Override
    public void surfaceDestroyed(@NonNull SurfaceHolder surfaceHolder) {
    }
}