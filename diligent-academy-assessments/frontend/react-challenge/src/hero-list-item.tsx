import React from 'react';
import { Hero } from './types';

interface HeroListItemProps {
  hero: Hero;
  onToggle: () => void;
}

const HeroListItem: React.FC<HeroListItemProps> = ({ hero, onToggle }) => (
  <li className={hero.available ? 'green-text' : 'red-text'} onClick={onToggle}>
    <p>
      {hero.name} {hero.available ? '"Available"' : ''}
    </p>
  </li>
);

export default HeroListItem;
