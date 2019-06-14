class Image
  def initialize(matrix) # to call this method, we use .new()
    @matrix = matrix # matrix is an array of arrays...
  end

  def find_coordinates()  #find the 1, make an array, save the pairs to it
    pair_list = []
    @matrix.each_with_index do |row, r|
      row.each_with_index do |val, c|
        if @matrix[r][c] == 1
          pair_list.push [r, c]
        end
      end
    end
    return pair_list
  end


  def transform()   #use the saved coordinates of the 1 to identify the spots around it that need changing
    pair_list = find_coordinates()

    pair_list.each do |r, c|
      @matrix[r - 1][c] = 1 unless r-1 < 0
      @matrix[r + 1][c] = 1 unless r+1 > 6
      @matrix[r][c - 1] = 1 unless c-1 < 0
      @matrix[r][c + 1] = 1 unless c+1 > 6
    end
  end

  def output_image()    #show the value of the array elements in neat little rows & columns
    @matrix.each do |row|
      row.each do |c|
        print c
        print ' '
      end
      puts
    end
  end
end



one_pixel_image = Image.new(
  [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0]
  ]
)

##one_pixel_image.output_image()
one_pixel_image.transform()
one_pixel_image.output_image()