class Pokemon
  attr_accessor :name, :type, :db, :id
  #attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = (?);"
    poke = db.execute(sql, [id]).flatten
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: poke[3])
  end
end
