class Leader

  attr_accessor :id, :name, :global_bonus, :active_bonus

  def self.open_connection

    conn = PG.connect(dbname: "blog")

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT * FROM leader ORDER BY id"

    results = conn.exec(sql)

    leaders = results.map do |result|
      self.hydrate(result)
    end

  end

  def self.hydrate leader_data

    leader = Leader.new

    leader.id = leader_data["id"]
    leader.name = leader_data["name"]
    leader.global_bonus = leader_data["global_bonus"]
    leader.active_bonus = leader_data["active_bonus"]

    leader

  end

  def self.find id

    conn = self.open_connection

    sql = "SELECT * FROM leader WHERE id = #{id}"

    results = conn.exec(sql)

    leaders = results.map do |result|
      self.hydrate(result)
    end

    leaders[0]

  end

  def save
    conn = Leader.open_connection

    if(!self.id)
      sql = "INSERT INTO leader (title, body) VALUES ('#{self.title}', '#{self.body}')"
      puts sql
    else
      sql = "UPDATE leader SET title='#{self.title}', body='#{self.body}'WHERE id = #{self.id}"
      puts sql
    end
    puts "yes"
    conn.exec(sql)

  end

  def self.destroy id
    conn = Leader.open_connection

      sql = "DELETE FROM leader WHERE id = #{id}"

    conn.exec(sql)
  end

end
