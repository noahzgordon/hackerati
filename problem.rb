## solution coded in ruby
## time complexity: O(n)

def consec_runs(arr)
  results = []
  0.upto(arr.length - 1) do |i|
    next if arr[i + 2].nil?
    results << i if 
      (arr[i] - arr[i + 1] == 1 && arr[i] - arr[i + 2] == 2) ||
      (arr[i] - arr[i + 1] == -1 && arr[i] - arr[i + 2] == -2)
  end
  
  results.empty? ? nil : results
end