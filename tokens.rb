module Token
  # Root token
  class Root
    def initialize(objs)
      @objs = objs
    end

    def to_s
      sep = ",\n"
      "Root{#{@objs.join sep}}"
    end

    def gen
      sep = "\n\n"
      @objs.map(&:gen).join sep
    end
  end

  # Obj token
  class Obj
    def initialize(key, exps)
      @key = key
      @exps = exps
    end

    def to_s
      sep = ",\n"
      "{\n#{@exps.join sep}\n}"
    end

    def gen
      s = "SELECT #{queries.map(&:gen).join ','}\n"
      f = "FROM #{@key.gen}\n"
      w = "WHERE #{patterns.map(&:gen).join ','}\n"
      s + f + w
    end

    def objects
      @exps.select { |e| e.is_a?(Token::Obj) }
    end

    def queries
      @exps.select { |e| e.is_a?(Token::Get) }
    end

    def mutations
      @exps.select { |e| e.is_a?(Token::Set) }
    end

    def patterns
      @exps.select { |e| e.is_a?(Token::Pattern) }
    end
  end

  # Get token
  class Get
    def initialize(key)
      @key = key
    end

    def to_s
      "Get<#{@key}>"
    end

    def gen
      @key.gen
    end
  end

  # Set token
  class Set
    def initialize(ptrn)
      @ptrn = ptrn
    end

    def to_s
      "Set<#{@ptrn}>"
    end
  end

  # ptrn token
  class Pattern
    def initialize(key, val)
      @key = key
      @val = val
    end

    def to_s
      "<#{@key}:#{@val}>"
    end

    def gen
      @key.gen + @val.gen
    end
  end

  # key token
  class Key
    def initialize(key)
      @str = key
    end

    def to_s
      "Key<#{@str}>"
    end

    def gen
      @str
    end
  end

  # val token
  class Val
    def initialize(val)
      @str = val
    end

    def to_s
      "Val<#{@str}>"
    end

    def gen
      @str
    end
  end
end
