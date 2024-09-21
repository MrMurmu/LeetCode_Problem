List<int> lexicalOrder(int n) {
  List<int> result = [];
  
  void dfs(int curr) {
    if (curr > n) return;
    result.add(curr);

    for (int i = 0; i < 10; i++) {
      int next = curr * 10 + i; 
      if (next > n) break; 
      dfs(next);
    }
  }

  for (int i = 1; i <= 9; i++) {
    dfs(i);
  }
  
  return result;
}

void main() {
  print(lexicalOrder(2));
  print(lexicalOrder(13));
}
