import 'dart:io';

class Solution {
String shortestPalindrome(String s) {
  if (s.isEmpty) return s;


  String newString = s + "#" + s.split('').reversed.join('');
  List<int> lps = _buildLPS(newString);

  int longestPalindromicPrefixLength = lps.last;

  String toAdd = s.substring(longestPalindromicPrefixLength);

  return toAdd.split('').reversed.join('') + s;
}

List<int> _buildLPS(String s) {
  List<int> lps = List.filled(s.length, 0);
  int length = 0;
  int i = 1;

  while (i < s.length) {
    if (s[i] == s[length]) {
      length++;
      lps[i] = length;
      i++;
    } else {
      if (length != 0) {
        length = lps[length - 1];
      } else {
        lps[i] = 0;
        i++;
      }
    }
  }
  return lps;
}
}

void main() {
  print("Insert charecter for make it shortest palindrom: ");
  var s = stdin.readLineSync();

  var sol = Solution();
  var pal = sol.shortestPalindrome("$s");
  stdout.write("The shortest palindrom of $s is : ");
  print(pal);
}
