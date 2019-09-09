class Song < ApplicationRecord
    # title:
        # Must not be blank
        # Cannot be repeated by the [same artist]in the [same year]
    validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year], message: 'should happen once per year with the same artist'}
    # released:
        #describing whether the song was ever officially released
        # Must be `true` or `false`
    validates :released, inclusion: {in: [true,false]}
    #release_year:
        # Optional if `released` is `false`
        # Must not be blank if `released` is `true`
        # Must be less than or equal to the current year
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.new.year}, if: :released
    # artist_name:
        #  Must not be blank
    validates :artist_name, presence: true
    # no validation for genre. i would do
    # validates :genre, presence: true
end
