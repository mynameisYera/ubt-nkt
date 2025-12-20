// Реализация для веб-платформы
import 'dart:js' as js;

void enterFullscreenWeb() {
  try {
    js.context.callMethod('enterFullscreen');
  } catch (e) {
    // Игнорируем ошибки
  }
}

void exitFullscreenWeb() {
  try {
    js.context.callMethod('exitFullscreen');
  } catch (e) {
    // Игнорируем ошибки
  }
}


