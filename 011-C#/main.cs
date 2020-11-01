public class HelloWorld {
  public static void Main(string[] args) {

    string table = System.IO.File.ReadAllText("./data.txt");

    // parse the matrix into a two dimensional array
    string[] lines = table.Split('\n');
    int[, ] matrix = new int[20, 20];
    for (int i = 0; i < 20; i++) {
      string[] tokens = lines [i]
                            .Trim()
                            .Split(' ');
      for (int j = 0; j < 20; j++) {
        matrix[i, j] = System.Convert.ToInt32(tokens[j]);
      }
    }

    int max = 0;
    int temp = 0;

    // check horizontal
    for (int i = 0; i < 20; i++) {
      for (int j = 0; j <= 16; j++) {
        temp = matrix[i, j] * matrix[i, j + 1] * matrix[i, j + 2] *
               matrix[i, j + 3];
        max = (temp > max) ? temp : max;
      }
    }
    // check vertical
    for (int j = 0; j < 20; j++) {
      for (int i = 0; i <= 16; i++) {
        temp = matrix[i, j] * matrix[i + 1, j] * matrix[i + 2, j] *
               matrix[i + 3, j];
        max = (temp > max) ? temp : max;
      }
    }
    // diagnol NW/SE
    for (int i = 0; i <= 16; i++) {
      for (int j = 0; j <= 16; j++) {
        temp = matrix[i, j] * matrix[i + 1, j + 1] * matrix[i + 2, j + 2] *
               matrix[i + 3, j + 3];
        max = (temp > max) ? temp : max;
      }
    }
    // diagnol NE/SW
    for (int i = 3; i < 20; i++) {
      for (int j = 0; j <= 16; j++) {
        temp = matrix[i, j] * matrix[i - 1, j + 1] * matrix[i - 2, j + 2] *
               matrix[i - 3, j + 3];
        max = (temp > max) ? temp : max;
      }
    }
    System.Console.WriteLine(max);
  }
}
