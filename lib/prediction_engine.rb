# frozen_string_literal: true

class PredictionEngine
  WEEKDAYS = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

  def user_prediction(user)
    weekday_orders(user.dinners)
  end

  def dinner_prediction
    weekday_orders(Dinner.all)
  end

  private

  def weekday_orders(records)
    weekday_orders = dinners_by_day(records).map { |k, v| [k, convert_to_hash(v)] }.to_h
    weekday_orders.map { |k, v| [k, convert_menu_item(v)] }.to_h
  end

  # returns hash with weekday and all dinners
  def dinners_by_day(records)
    records.each_with_object({}) do |dinner, hash|
      weekday = WEEKDAYS[dinner.created_at.wday]
      if hash.key? weekday
        hash[weekday] << dinner.complete_order
      else
        hash[weekday] = [dinner.complete_order]
      end
    end
  end

  # returns hash with orders
  def convert_to_hash(array)
    hash = {}
    array.each do |e|
      e.each do |k, v|
        if hash.key? k
          hash[k] << v
          hash[k] = hash[k].flatten
        else
          hash[k] = v
        end
      end
    end
    hash
  end

  # returns hash with menu_item and count
  def convert_menu_item(order)
    order.map { |k, v| [k, menu_item_count(v)] }.to_h
  end

  # converts array to hash with count of each element
  def menu_item_count(menu_items)
    menu_items.each_with_object(Hash.new(0)) do |menu_item, hash|
      hash[menu_item] += 1
    end
  end
end
