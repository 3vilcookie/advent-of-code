
class Circuit

  attr_reader :nodes
  def initialize
    @nodes = {}
  end

  def parse(line)
    instruction = 
      /^(?<input1>[0-9a-z]*)(\s*(?<operation>[A-Z]+)\s(?<input2>[0-9a-z]+))?\s->\s(?<output>[a-z]+)$/
      .match(line)

    a = instruction['input1']
    b = instruction['input2']
    operation = if not instruction['operation'].nil?
                  instruction['operation'].downcase.to_sym
                else
                  :assign
                end

    a = b if operation == :not
    add_node(a,b, operation, instruction['output'])
  end

  def add_node(a,b,op,y)
    raise "Node #{y.to_s} already exists!" if @nodes.has_key? y

    @nodes[y] = {a: a, b: b, op: op}
  end

  def query(y)
    puts "Resolving node #{y} #{y.class.to_s}"
    # Leaf reached
    return y.to_i if y.to_i.to_s == y
  
    raise "Unknown node '#{y}'" unless @nodes.has_key? y

    node = @nodes[y]
    puts "Got node #{node.inspect}"
    result = 0 
    case node[:op]
      when :assign
        result = query(node[:a])
      when :not
        result = ~query(node[:a])
        result += 2**16 if result < 0
      when :or
        result = query(node[:a]) | query(node[:b])
      when :and
        result = query(node[:a]) & query(node[:b])
      when :lshift
        result = query(node[:a]) << query(node[:b])
      when :rshift
        result =  query(node[:a]) >> query(node[:b])
      else
        raise "Unknown operation #{node[:op]}"
    end

    # Store result to node in order to avoid calculating it again
    @nodes[y] = {a: result.to_s, b: nil, op: :assign}
    result
  end
end
