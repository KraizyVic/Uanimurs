class Queries{
  static const String trendingAnime = '''
    query GetAnimeDetails{
      Page (){
        media(sort: TRENDING_DESC,isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';

  static const String topRatedAnimes = '''
    query GetAnimeDetails{
      Page (){
        media(type: ANIME, sort: SCORE_DESC,isAdult: false) {
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';

  static const String popularAnime = '''
    query GetAnimeDetails{
      Page (){
        media(sort: [POPULARITY_DESC],isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
  static const String recentlyReleasedAnimes = '''
    query GetAnimeDetails{
      Page (){
        media(type: ANIME, status: RELEASING, sort: START_DATE_DESC,isAdult: false) {
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
  static String searchQuery() => '''
    query SearchAnime(\$search: String){
      Page (){
        media(search: \$search,sort: [POPULARITY_DESC],isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';

  static String animeDetailsQuery()=> '''
    query GetAnimeDetails(\$id: Int){
      Media(id: \$id, type: ANIME){
        id
        idMal
        startDate {
          day
          month
          year
        }
        endDate {
          day
          month
          year
        }
        season
        type
        format
        status
        episodes
        duration
        isAdult
        meanScore
        popularity
        genres
        trailer {
          id
          site
          thumbnail
        }
        title {
          native
          english
          romaji
        }
        coverImage {
          medium
          large
          extraLarge
        }
        bannerImage
        description
        characters (perPage: 10){
          edges {
            id
            name
            role
            node {
              age
              name {
                first
                last
              }
              image {
                large
                medium
              }
            }
            voiceActors {
              name {
                first
                last
              }
              languageV2
              image {
                medium
                large
              }
            }
  
          }
        }  
      }
    }
  ''';
}

