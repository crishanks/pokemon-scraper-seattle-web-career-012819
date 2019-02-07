class Pokemon

    attr_accessor :id, :name, :type, :hp, :db

    def initialize(id: nil, name: 'mew', type: 'magic', hp: nil, db: nil)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        rows = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        row = rows.first
        Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3])
    end

    # def alter_hp(id, hp:, db)
    #     db.execute("UPDATE TABLE pokemon SET hp = ? WHERE id = ?", hp, id)
    # end
end
