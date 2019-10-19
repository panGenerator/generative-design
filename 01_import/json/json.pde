JSONArray values;

void setup() {
  size(150, 150);
  values = loadJSONArray("data.json"); 
}
void draw() {
 background(255);
 fill(0);
 noStroke();
 for (int i = 0; i < values.size(); i++) {
    JSONObject field = values.getJSONObject(i); 
    int id = field.getInt("id");
    int value = field.getInt("value");
    rect(i*50, 0, 50, value);
  } 
  
}
