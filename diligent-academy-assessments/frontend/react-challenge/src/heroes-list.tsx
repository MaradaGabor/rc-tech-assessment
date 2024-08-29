import { useState, useEffect } from 'react';
import { callApi } from './call-api';
import HeroListItem from './hero-list-item';
import { Hero } from './types';
import './styling/heroes-list.css';

const useHeroes = () => {
  const [heroes, setHeroes] = useState<Hero[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchHeroes = async () => {
      try {
        const data = await callApi<Hero[]>('heroes');
        setHeroes(data);
      } catch (error) {
        setError('Failed to fetch heroes');
      } finally {
        setLoading(false);
      }
    };

    fetchHeroes();
  }, []);

  return { heroes, loading, error, setHeroes };
};

const HeroesList = () => {
  const { heroes, loading, error, setHeroes } = useHeroes();

  const toggleAvailability = (id: number) => {
    setHeroes((prevHeroes) =>
      prevHeroes.map((hero) =>
        hero.id === id ? { ...hero, available: !hero.available } : hero
      )
    );
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div>
      <h2>Heroes</h2>
      <ol className="cards">
        {heroes.map((hero) => (
          <HeroListItem
            key={hero.id}
            hero={hero}
            onToggle={() => toggleAvailability(hero.id)}
          />
        ))}
      </ol>
    </div>
  );
};

export default HeroesList;
