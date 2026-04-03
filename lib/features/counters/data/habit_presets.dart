
import '../models/habit_preset.dart';

const List<HabitPreset> habitPresets = [
  HabitPreset(
    keyName: 'alcohol',
    title: 'Алкоголь',
    emoji: '🍷',
    reasons: [
      'Хочу лучше себя чувствовать',
      'Хочу лучше спать',
      'Хочу быть собраннее',
      'Хочу больше контролировать свою жизнь',
    ],
  ),
  HabitPreset(
    keyName: 'smoking',
    title: 'Сигареты',
    emoji: '🚭',
    reasons: [
      'Хочу улучшить здоровье',
      'Хочу легче дышать',
      'Хочу меньше тратить денег',
      'Хочу чувствовать себя свободнее',
    ],
  ),
  HabitPreset(
    keyName: 'sugar',
    title: 'Сахар',
    emoji: '🍰',
    reasons: [
      'Хочу меньше скачков энергии',
      'Хочу стабильное самочувствие',
      'Хочу лучше питаться',
      'Хочу похудеть',
    ],
  ),
  HabitPreset(
    keyName: 'coffee',
    title: 'Кофе',
    emoji: '☕',
    reasons: [
      'Хочу лучше спать',
      'Хочу убрать тревожность',
      'Хочу меньше зависеть от стимуляторов',
      'Хочу стабильную энергию без кофеина',
    ],
  ),
  HabitPreset(
    keyName: 'porn',
    title: 'Порно',
    emoji: '🔞',
    reasons: [
      'Хочу больше самоконтроля',
      'Хочу больше энергии',
      'Хочу улучшить концентрацию',
      'Хочу вернуть ясность мышления',
    ],
  ),
  HabitPreset(
    keyName: 'social',
    title: 'Соцсети',
    emoji: '📱',
    reasons: [
      'Хочу меньше отвлекаться',
      'Хочу вернуть концентрацию',
      'Хочу меньше зависеть от телефона',
      'Хочу освободить время',
    ],
  ),
  HabitPreset(
    keyName: 'games',
    title: 'Игры',
    emoji: '🎮',
    reasons: [
      'Хочу вернуть контроль над временем',
      'Хочу делать больше полезного',
      'Хочу меньше прокрастинировать',
      'Хочу лучше концентрироваться',
    ],
  ),
  HabitPreset(
    keyName: 'custom',
    title: 'Своя привычка',
    emoji: '💪',
    reasons: [
      'Хочу улучшить здоровье',
      'Хочу больше энергии',
      'Хочу больше контроля над собой',
      'Хочу изменить жизнь к лучшему',
    ],
    isCustom: true,
  ),
];

HabitPreset? findHabitPresetByKey(String? key) {
  if (key == null) return null;
  for (final preset in habitPresets) {
    if (preset.keyName == key) return preset;
  }
  return null;
}
