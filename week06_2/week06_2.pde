 ///他使用了waveform的物件變數，來分析音樂


import processing.sound.*;


SoundFile sample;//宣告SoundFile物件變數
Waveform waveform;///宣告WAVEFORM物件變數

// Define how many samples of the Waveform you want to be able to read at once
int samples = 100;//一次獨入多少sample: 100 個sample

public void setup() {
  size(640, 360);
  ///background(255);

  // Load and play a soundfile and loop it.
  sample = new SoundFile(this, "beat.aiff");//讀入音樂檔案
  sample.loop();///循環播放 之前PLAY是撥放一次
  // Create the Waveform analyzer and connect the playing soundfile to it.
  waveform = new Waveform(this, samples);//享用100格來分析音樂
  waveform.input(sample);//享用剛剛的音樂檔作分析
}

public void draw() {
  // Set background color, noFill and stroke style
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  waveform.analyze();//進行波型的分析
  
  beginShape();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, 0, width),//座標對應0到100的職 拉長視窗的長度640
      map(waveform.data[i], -1, 1, 0, height)///y座標就是WAVEFORMDATA[I]的值
    );
  }
  endShape();
}
