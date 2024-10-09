class Solution {
  int minAddToMakeValid(String s) {
    int openNeeded = 0;  // Count of unmatched opening parentheses
    int closeNeeded = 0; // Count of unmatched closing parentheses

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        openNeeded++; // Found an opening parenthesis
      } else if (s[i] == ')') {
        if (openNeeded > 0) {
          openNeeded--; // Match with an opening parenthesis
        } else {
          closeNeeded++; // Need an opening parenthesis for this closing one
        }
      }
    }

    // Total moves needed is the sum of unmatched opening and closing parentheses
    return openNeeded + closeNeeded;
  }
}

void main() {
  Solution solution = Solution();
  
  String s1 = "())";
  print(solution.minAddToMakeValid(s1)); // Output: 1
  
  String s2 = "(((";
  print(solution.minAddToMakeValid(s2)); // Output: 3
}
