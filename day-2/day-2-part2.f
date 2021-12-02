      program Day2Part2
      implicit none

      integer :: ios
      integer, parameter :: read_unit = 99

      character(100) :: line
      character(50) :: instruction, argument
      integer :: index
      
      integer :: value = 0, aim = 0, position = 0, depth = 0
      
      ! open the file for reading
      open(unit = read_unit, file = 'input.txt', iostat = ios)
      if (ios /= 0) stop "Error while trying to open file 'input.txt'!"

      ! read the file and parse input
      do
         read(read_unit, '(A)', iostat=ios) line
         if (ios /= 0) exit

         ! split the line on a space
         line = trim(line)
         index = scan(line, ' ')
         instruction = line(1:index - 1)
         argument = line(index + 1:)

         print *, instruction, argument

         ! Parse the argument that was read
         read (unit = argument, fmt = *) value

         ! Execute the instruction
         if (instruction == 'forward') then
            position = position + value
            depth = depth + aim * value
         else if (instruction == 'up') then
            aim = aim - value
         else if (instruction == 'down') then
            aim = aim + value
         end if
      end do

      close(unit = read_unit)

      ! output result
      print *, 'Depth * Position = ', depth * position

      end program Day2Part2

