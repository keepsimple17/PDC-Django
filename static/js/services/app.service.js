/**
 * Created by Paul on 08/01/2018.
 */

class AppService {
  constructor() {
    console.log('app constructor');
  }

  getTwitterName(name) {
    if (name && name.startsWith('@')) {
      return name.slice(1)
    } else {
      return name;
    }
  }

  getPhotoPath(photo, user) {
    if (photo) {
      return photo
    } else if (user.gender === 'M') {
      return '/static/images/imagem_avatar_homem.png';
    } else if (user.gender === 'M') {
      return '/static/images/imagem_avatar_mulher.png';
    } else {
      return '/static/images/unknown-avatar.png';
    }
  }
}
